
class ResumeController < ApplicationController
  rescue_from Imprezify::PDFGenerationFailed, with: :pdf_generation_failed
  rescue_from Net::ReadTimeout, with: :pdf_generation_failed

  before_action :set_resume, except: :index
  skip_before_action :authenticate_user!, only: :share

  def index
    @resumes = current_user.resumes
    render layout: 'landing'
  end

  def edit
    if params[:entity_name].present?
      entity = @resume.try(params[:entity_name].to_sym)&.build
      entity.save(validate: false)
    end
  end

  def update
    @resume.update(allowed_params)
  end

  def export_as_pdf
    PdfGenerationJob.new(@resume).enqueue(wait: 1.minute)
  end

  def generate_share_link
    @resume.update(sharing_code: SecureRandom.hex)
  end

  def share
    @resume = Resume.find_by_sharing_code(params[:share_code])
    render inline: ResumeTemplatingEngine::Get.new(@resume).render_as_string
  end

  private

  def allowed_params
    params.require(:resume).permit!
  end

  def set_resume
    @resume = Resume.where(id:  params[:id], user: current_user).first
  end

  def pdf_generation_failed
    flash[:error] = 'Unable to generate PDF'
    redirect_to edit_resume_path(id: @resume.id)
  end
end
