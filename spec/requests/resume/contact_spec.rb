require 'rails_helper'

feature 'Contact Form', :js do
  it_behaves_like 'a common name and value', :contact, 0
end
