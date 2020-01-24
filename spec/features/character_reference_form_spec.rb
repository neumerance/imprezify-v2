require 'rails_helper'

feature 'CharacterReference Form', :js do
  it_behaves_like 'an entity', :character_references, 1, {
    name: 'Mr. Rodrigo Duterte',
    title: 'President of Republic of the Philippines',
    phone: '+63 947 721 0530',
    email: 'digong@duterte.com'
  }
end
