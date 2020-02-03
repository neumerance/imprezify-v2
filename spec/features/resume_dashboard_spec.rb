require 'rails_helper'

feature 'Resume Dashboard', :js do
  let(:user) { create(:user) }

  background do
    login_as user
  end

  describe 'Dashboard' do
    before do
      visit resume_index_path
    end

    it 'has no resume yet' do
      expect(page).to have_content('You have no resume yet.')
    end

    it 'has create button' do
      expect(page).to have_link('here')
    end
  end

  describe 'Selecting a template' do
    before do
      visit new_resume_path
    end

    it 'displays resume template selection page' do
      expect(page).to have_content('CREATE RESUME')
      expect(page).to have_content('Select your desired template')
      expect(page).to have_link('Back to dashboard')
    end

    it 'can choose template' do
      all('a', text: 'Choose').first.click
      expect(page).to have_css('#create-resume-modal')
    end
  end

  describe 'Creating a new resume' do
    before do
      visit new_resume_path
      all('a', text: 'Choose').first.click
    end

    it 'creates a new resume' do
      within '#create-resume-modal' do
        fill_in 'resume[name]', with: 'Talaan ng aking pagkatao'
        click_on 'Create'
      end

      expect(page).to have_content('Talaan ng aking pagkatao')
    end
  end
end
