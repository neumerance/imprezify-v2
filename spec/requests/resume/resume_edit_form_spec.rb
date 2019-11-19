require 'rails_helper'

feature 'Resume Edit Form', :js do
  let(:resume) { create(:resume) }
  let(:user) { resume.user }

  background do
    login_as user
    visit edit_resume_path(resume)
  end

  scenario 'Filling up basic info' do
    within('#basic-info') do
      attach_file('resume[basic_info_attributes][photo]', 'spec/fixtures/photo.jpeg', make_visible: true)
      fill_in 'resume[basic_info_attributes][name]', with: FFaker::Name.name
      fill_in 'resume[basic_info_attributes][title]', with: FFaker::Job.title
      fill_in 'resume[basic_info_attributes][profile_overview]', with: FFaker::Lorem.paragraph
      choose('resume_basic_info_attributes_gender_male')
    end
    expect(resume.reload.basic_info).not_to be_nil
  end
end
