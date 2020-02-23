include Rails.application.routes.url_helpers

class ApplicationMailer < ActionMailer::Base
  layout 'mailer'

  default from:     -> { 'info@imprezify.com' },
          reply_to: -> { 'no-reply@imprezify.com' }

  def send_generated_pdf(resume)
    @user = resume.user
    @resume = resume
    file_path = set_resume_as_attachment(resume)
    attachments["#{resume.name.parameterize}-#{Time.now.to_i}.pdf"] = {
      mime_type: 'application/pdf',
      content: File.read(file_path)
    }
    TempFileCleanupJob.set(wait: 15.minutes).perform_later(file_path)
    mail(to: @user.email, subject: 'Thank you for using Imprezify')
  end

  def send_feedback(feedback)
    @feedback = feedback
    mail(to: 'info.imprezify@gmail.com', subject: feedback.subject)
  end

  private

  def set_resume_as_attachment(resume)
    response = Api2PdfService.generate_pdf_data(
      "http://#{ENV['DOMAIN']}#{resume_share_path(share_code: @resume.sharing_code)}"
    )
    Imprezify::PDFGenerationFailed unless response.success?
    ResponseToPdf.generate(content: response.body)
  end
end
