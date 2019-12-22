class ResumeController < ApplicationController
  rescue_from Imprezify::PDFGenerationFailed, with: :pdf_generation_failed
  rescue_from Net::ReadTimeout, with: :pdf_generation_failed

  before_action :set_resume, only: [
    :edit, :update, :destroy,
    :add_more_entity, :preview,
    :export_as_pdf
  ]

  skip_before_action :authenticate_user!, only: :share

  def index
    @resumes = current_user.resumes
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

  def preview
    render layout: false
  end

  def export_as_pdf
    # byebug
    response = Api2PdfService.generate_pdf_data(
      "#{request.base_url}#{resume_share_path(share_code: @resume.sharing_code)}"
    )
    Imprezify::PDFGenerationFailed unless response.success?
    file_path = ResponseToPdf.generate(content: response.body)
    TempfileCleanupJob.new(file_path).enqueue(wait: 1.minute)
    send_file(file_path, type: 'application/pdf')
  end

  def generate_share_link
    @resume.update(sharing_code: SecureRandom.hex)
  end

  def share
    @resume = Resume.find_by_sharing_code(params[:share_code])
    render layout: false
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
