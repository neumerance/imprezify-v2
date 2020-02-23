require 'rails_helper'

feature 'FeedbackRequest', :js do
  describe 'Reviews' do
    before { visit review_path }

    it 'render review page' do
      expect(page).to have_content('Tell us your experience')
    end

    it 'submits users reviews' do
      fill_in_form
      expect(page).to have_content('Thank you')
      expect(page).to have_content('We have successfully sent your feedback. We will get back to you if necessary.')
    end
  end

  describe 'Contact Us' do
    before { visit contact_us_path }

    it 'render review page' do
      expect(page).to have_content('How can we help you?')
    end

    it 'submits users concern' do
      fill_in_form
      expect(page).to have_content('Thank you')
      expect(page).to have_content('We have successfully sent your concern, we will get back to you as soon as we can.')
    end
  end

  private

  def fill_in_form
    within 'form' do
      fill_in 'feedback[email]', with: FFaker::Internet.email
      fill_in 'feedback[message]', with: FFaker::Lorem.sentence
      click_on 'Submit'
    end
  end
end
