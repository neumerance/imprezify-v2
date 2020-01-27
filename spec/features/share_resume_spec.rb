require 'rails_helper'

feature 'Sharing of resume via link', :js do
  let(:resume) { create(:resume, :complete_resume) }

  background do
    login_as resume.user
    visit edit_resume_path(resume)
    click_on 'Share'
  end

  let(:notice) do
    "Secured shareable URL\n×\nIf you need to revoke access to those people who have this link, "\
    "just clickhereto generate a fresh link."
  end

  it 'renders share modal visible' do
    within('#shareModal', wait: 1) do
      expect(page).to have_content(notice)
    end
  end

  it 'renews the shareable link' do
    within('#shareModal', wait: 1) do
      click_on 'here'
      wait_for_ajax
      expect(page).to have_content('Share code has been renewed, please use the URL below to share your resume.')
    end
  end
end
