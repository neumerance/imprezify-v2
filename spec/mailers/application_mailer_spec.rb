require 'rails_helper'

describe ApplicationMailer do
  let(:url) { 'http://www.google.com' }
  let(:resume) { create(:resume) }

  before { mock_api_2_pdf }

  describe '#send_generated_pdf' do
    subject { ApplicationMailer.send_generated_pdf(resume) }

    it 'sends an email' do
      expect { subject.deliver }.to change { ActionMailer::Base.deliveries.count }.by(1)
    end

    context 'mail content' do
      let(:mail) { subject.deliver }
      let(:attachments) { mail.attachments }

      it 'has right contents' do
        expect(mail.from).to include 'info@imprezify.com'
        expect(mail.to).to include resume.user.email
        expect(mail.subject).to eq 'Imprezify - Thank you for downloading'
      end

      it 'attaches pdf' do
        expect(attachments.any?).to be_truthy
        expect(attachments.first.content_type).to eq 'application/pdf'
      end
    end
  end
end
