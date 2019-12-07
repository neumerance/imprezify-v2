require 'rails_helper'

feature 'Basic Info form', :js do
  let(:resume) { create(:resume) }
  let(:user) { resume.user }
  let!(:basic_info) { create(:basic_info, resume: resume) }

  background do
    login_as user
    visit edit_resume_path(resume)
  end

  scenario 'filling up basic info fields' do
    within('#basic-info') do
      attach_file('basic_info[photo]', 'spec/fixtures/photo.jpeg', make_visible: true)
      fill_in 'basic_info[name]', with: FFaker::Name.name
      fill_in 'basic_info[title]', with: FFaker::Job.title
      fill_in 'basic_info[profile_overview]', with: FFaker::Lorem.paragraph
      set_field_value_by_js('basic_info_birthdate', 'value', '1987-04-15')
      find('#basic_info_gender_male').click

      click_on 'Show advanced fields'
      expect(page).to have_css('#basic_info_collapsible')

      fill_in 'basic_info[nationality]', with: 'Filipino'
      fill_in 'basic_info[religion]', with: 'Christian'
      fill_in 'basic_info[address]', with: FFaker::Address.street_address
      fill_in 'basic_info[city]', with: FFaker::Address.city
      fill_in 'basic_info[country]', with: FFaker::Address.country
      fill_in 'basic_info[postal_code]', with: FFaker::Address.zip_code
    end

    wait_for_ajax
    %w(photo name title profile_overview birthdate gender nationality religion address city country postal_code).each do |f|
      expect(resume.reload.basic_info.try(f.to_sym).present?).to be_truthy
    end
  end
end
