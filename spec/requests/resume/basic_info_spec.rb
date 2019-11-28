require 'rails_helper'

feature 'Resume Edit Form', :js do
  let(:resume) { create(:resume) }
  let(:user) { resume.user }

  background do
    login_as user
    visit edit_resume_path(resume)
  end

  scenario 'filling up basic info fields' do
    within('#basic-info') do
      attach_file('resume[basic_info_attributes][photo]', 'spec/fixtures/photo.jpeg', make_visible: true)
      fill_in 'resume[basic_info_attributes][name]', with: FFaker::Name.name
      fill_in 'resume[basic_info_attributes][title]', with: FFaker::Job.title
      fill_in 'resume[basic_info_attributes][profile_overview]', with: FFaker::Lorem.paragraph
      set_field_value_by_js('resume_basic_info_attributes_birthdate', 'value', '1987-04-15')

      click_on 'Show advanced fields'
      expect(page).to have_css('#basic_info_collapsible')

      fill_in 'resume[basic_info_attributes][nationality]', with: 'Filipino'
      fill_in 'resume[basic_info_attributes][religion]', with: 'Christian'
      fill_in 'resume[basic_info_attributes][address]', with: FFaker::Address.street_address
      fill_in 'resume[basic_info_attributes][city]', with: FFaker::Address.city
      fill_in 'resume[basic_info_attributes][country]', with: FFaker::Address.country
      fill_in 'resume[basic_info_attributes][postal_code]', with: FFaker::Address.zip_code
      2.times { find('#resume_basic_info_attributes_gender_male').click }
    end

    wait_for_ajax
    %w(photo name title profile_overview birthdate gender nationality religion address city country postal_code).each do |f|
      expect(resume.reload.basic_info.try(f.to_sym).present?).to be_truthy
    end
  end
end
