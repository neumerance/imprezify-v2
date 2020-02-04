require 'rails_helper'

feature 'User sign in', :js do
  let(:user) { create(:user, password: 'ABC12abc', password_confirmation: 'ABC12abc') }

  before do
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: 'ABC12abc'
    click_on 'Log in'
  end

  it 'signs in the user' do
    expect(page).to have_content('Dashboard')
  end
end
