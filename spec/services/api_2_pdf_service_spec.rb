require 'rails_helper'

describe Api2PdfService do
  before { mock_api_2_pdf }
  let(:url) { 'http://www.google.com' }

  subject do
    Api2PdfService.generate_pdf_data(url)
  end

  it 'requests successfully' do
    expect(subject.success?).to be_truthy
  end

  it 'returns a sample pdf content' do
    expect(subject.body).to eq 'Example PDF response'
  end
end
