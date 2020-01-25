require 'rails_helper'

describe ResponseToPdf do
  let(:url) { 'http://www.google.com' }
  let(:content) { Api2PdfService.generate_pdf_data(url) }
  let(:file_path) { "tmp/resume-#{content.object_id}.pdf" }

  before do
    mock_api_2_pdf
    ResponseToPdf.generate(content: content)
  end

  after do
    FileUtils.rm file_path
  end

  it 'generate a pdf file in tmp folder' do
    expect(File.file?(file_path)).to be_truthy
  end
end
