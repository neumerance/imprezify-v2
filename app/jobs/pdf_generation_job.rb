class PdfGenerationJob < ApplicationJob
  queue_as :default

  def perform(resume)
    ApplicationMailer.send_generated_pdf(resume).deliver
  end
end
