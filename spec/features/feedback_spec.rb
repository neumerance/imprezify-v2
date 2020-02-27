require 'rails_helper'

feature 'Feedback Workflow', :js do
  let(:user) { create(:user) }
  let(:resume) { create(:resume, name: 'myresume') }

  background do
    login_as user
  end

  context 'when exporting resume' do
    it 'redirects to review page' do
      visit export_as_pdf_resume_path(resume)
      expect(page).to have_content 'Tell us your experience'
    end
  end

  context 'when user have already given its feedback' do
    it 'redirects to thank you page' do
      user.update(sent_feedback: true)
      visit export_as_pdf_resume_path(resume)
      expect(page).to have_content 'Thank you'
    end
  end
end
