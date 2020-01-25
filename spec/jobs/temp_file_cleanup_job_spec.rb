require 'rails_helper'

describe TempFileCleanupJob, type: :job do
  describe '#perform_later' do
    it 'enques' do
      ActiveJob::Base.queue_adapter = :test
      expect {
        TempFileCleanupJob.perform_later
      }.to have_enqueued_job
    end

    describe 'temporary pdf cleanups' do
      let(:url) { 'http://www.google.com' }
      let(:content) { Api2PdfService.generate_pdf_data(url) }
      let(:file_path) { "tmp/resume-#{content.object_id}.pdf" }

      before do
        mock_api_2_pdf
        ResponseToPdf.generate(content: content)
      end

      it 'generates pdf' do
        expect(File.file?(file_path)).to be_truthy
      end

      it 'deletes pdf' do
        TempFileCleanupJob.perform_now(file_path)
        expect(File.file?(file_path)).to be_falsey
      end
    end
  end
end
