require 'rails_helper'

feature 'Resume Edit Form', :js do
  let(:resume) { create(:resume) }
  let!(:basic_info) { create(:basic_info, resume: resume) }
  let(:user) { resume.user }

  background do
    login_as user
    visit edit_resume_path(resume)
  end

  scenario 'When there are no work experience yet' do
    within('#work-experiences') do
      expect(page).to have_content('Click plus button above to add work experience.')
    end
  end

  scenario 'When adding work experience' do
    find('h2', text: 'Work Experiences').find('a').click

    within('#experience_0') do
      expect(page).to have_css('a[name="experience_0"]', visible: false)
      expect(page).to have_css('#resume_work_experiences_attributes_0_id', visible: false)
      expect(find('#resume_work_experiences_attributes_0_id', visible: false)['value']).not_to be_empty

      fill_in 'resume[work_experiences_attributes][0][name]', with: FFaker::Company.name
      fill_in 'resume[work_experiences_attributes][0][title]', with: FFaker::Job.title

      set_field_value_by_js('resume_work_experiences_attributes_0_since', 'value', '2014-04-01')
      set_field_value_by_js('resume_work_experiences_attributes_0_until', 'value', '2016-01-03')

      click_on 'Show advanced fields'
      expect(page).to have_css('#work_experience_collapsible_0')

      click_on 'Add Descriptions'
      expect(page).to have_css('input[name="resume[work_experiences_attributes][0][description][]"]')
      find('input[name="resume[work_experiences_attributes][0][description][]"]').set(FFaker::Lorem.paragraph)

      within('#work_experience_collapsible_0') do
        attach_file('resume[work_experiences_attributes][0][logo]', 'spec/fixtures/photo.jpeg', make_visible: true)
        fill_in 'resume[work_experiences_attributes][0][address]', with: FFaker::Address.street_address
        fill_in 'resume[work_experiences_attributes][0][city]', with: FFaker::Address.city
        fill_in 'resume[work_experiences_attributes][0][country]', with: FFaker::Address.country
        fill_in 'resume[work_experiences_attributes][0][postal_code]', with: FFaker::Address.zip_code
      end

      wait_for_ajax

      expect(resume.reload.work_experiences.first.description.any?).to be_truthy

      %w(name title since until logo address city country).each do |f|
        expect(resume.reload.work_experiences.first.try(f.to_sym).present?).to be_truthy
      end
    end
  end
end
