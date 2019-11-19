require 'rails_helper'

feature 'Resume Edit Form', :js do
  let(:resume) { create(:resume) }
  let(:user) { resume.user }

  background do
    login_as user
    visit edit_resume_path(resume)
  end

  scenario 'Filling up basic info' do
    byebug
  end
end
