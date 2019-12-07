require 'rails_helper'

feature 'Character Reference Form', :js do
  it_behaves_like 'an character reference', :character_reference, 1
end
