require 'rails_helper'

feature 'User sign up', :js do
  let!(:email) { FFaker::Internet.email }

  before do
    visit new_user_registration_path
  end

  describe 'valid signup' do
    before do
      fill_in_form
    end

    it 'asks the user to confirm its email' do
      expect(page).to have_content(
        'A message with a confirmation link has been sent '\
        'to your email address. Please follow the link to activate your account.'
      )
    end

    it 'creates user' do
      expect(User.find_by_email(email)).to be_present
    end
  end

  describe 'invalid signup' do
    before do
      within '#new_user' do
        click_on 'Sign up'
      end
    end

    it 'fails to signup' do
      expect(page).to have_content('2 errors prohibited this user from being saved:')
    end
  end

  private

  def fill_in_form
    within '#new_user' do
      fill_in 'user[email]', with: email
      fill_in 'user[password]', with: 'ABC12abc'
      fill_in 'user[password_confirmation]', with: 'ABC12abc'
      click_on 'Sign up'
    end
  end
end
