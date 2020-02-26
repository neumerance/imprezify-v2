
class ResumeController < ApplicationController
  rescue_from Imprezify::PDFGenerationFailed, with: :pdf_generation_failed
  rescue_from Net::ReadTimeout, with: :pdf_generation_failed

  before_action :set_resume, except: :index
  before_action :set_manifest, only: [:index, :new]
  skip_before_action :authenticate_user!, only: :share
  before_action :set_resume_edit_tags, only: :edit

  layout 'landing', only: [:index, :new]

  def index
    @resumes = current_user.resumes
    @manifest = ResumeTemplatingEngine::Manifest.new.get
  end

  def new
    @resume = Resume.new
  end

  def create
    resume_params[:user] = current_user
    Resume.create!(resume_params)
    redirect_to resume_index_path
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

  def destroy; end

  def export_as_pdf
    PdfGenerationJob.perform_later(@resume)
    display_thank_you_or_ask_feedback
  end

  def generate_share_link
    @resume.update(sharing_code: SecureRandom.hex)
    flash[:info] = "Share code has been renewed, please use the URL below to share your resume."
    render layout: false
  end

  def share
    @resume = Resume.find_by_sharing_code(params[:share_code])
    render inline: ResumeTemplatingEngine::Get.new(@resume).render_as_string
  end

  private

  def set_manifest
    @manifest ||= ResumeTemplatingEngine::Manifest.new.get
  end

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

  def resume_params
    params.require(:resume).permit!
  end

  def display_thank_you_or_ask_feedback
    if current_user.sent_feedback?
      flash[:notice] = "Thank you for using Imprezify.\n\n" \
                       "We have sent your resume to your email."
      redirect_to thankyou_path
    else
      flash[:info] = "We have sent your resume to your email.\n\n" \
                     "While waiting for it, please give us a minute or two.\n\n"\
                     "Tell us how your experience goes with Imprezify."
      redirect_to review_path
    end
  end
end
