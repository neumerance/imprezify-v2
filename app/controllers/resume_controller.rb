class ResumeController < ApplicationController
  rescue_from Imprezify::PDFGenerationFailed, with: :pdf_generation_failed
rescue_from Net::ReadTimeout, with: :pdf_generation_failed

  before_action :set_resume, only: [
    :edit, :update, :destroy,
    :add_more_entity, :preview,
    :export_as_pdf
  ]

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
    response = Api2PdfService.generate_pdf_data('http://www.google.com')
    Imprezify::PDFGenerationFailed unless response.success?
    file_path = ResponseToPdf.generate(content: response.body)
    send_file(file_path, type: 'application/pdf')
    # File.delete(file_path)
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
