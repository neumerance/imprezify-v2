require 'rails_helper'

feature 'Basic Info form', :js do
  let(:resume) { create(:resume) }
  let(:user) { resume.user }
  let!(:basic_info) { create(:basic_info, resume: resume) }
  let!(:sample) do
    {
      name: 'Juan Kamote',
      title: 'Magpapandesal',
      profile_overview: 'Laging mainit ang aking pandesal, masarap at mabango tuwing umaga.',
      birthdate: '1986-03-01',
      gender: 'male',
      nationality: 'Pinoy',
      religion: 'MCGI',
      address: '#1 Di Makita St.',
      city: 'Diliman City',
      country: 'Agartha',
      postal_code: '232323',
      photo: 'spec/fixtures/photo.jpeg'
    }
  end
  let(:expectation) { resume.reload.basic_info.as_json.symbolize_keys }

  background do
    login_as user
    visit edit_resume_path(resume)
  end

  scenario 'filling up basic info fields' do
    within('#basic-info') do
      click_on 'Show advanced fields'
      expect(page).to have_css('#basic_info_collapsible')
      fill_in_form(sample)
    end

    sample.each do |key, value|
      if key == :photo
        expect(expectation[:photo_file_name]).not_to be_empty
      else
        expect(expectation[key]).to eq value
      end
    end
  end

  private

  def fill_in_form(sample)
    sample.each do |key, value|
      if key == :photo
        attach_file('basic_info[photo]', value, make_visible: true)
      elsif key == :gender
        find("#basic_info_gender_#{value}").click
      elsif key == :birthdate
        set_field_value_by_js('basic_info_birthdate', value)
      else
        fill_in "basic_info[#{key}]", with: value
      end
    end
    submit_form_by_js("edit_basic_info_#{basic_info.id}")
    wait_for_ajax
  end
end
