require 'rails_helper'

feature 'Contacts Form', :js do
  it_behaves_like 'common name and value', :contacts, 1, {
    name: {
      type: :select,
      value: 'Email'
    },
    value: {
      type: :input,
      value: 'mang-jose@filipino.com'
    }
  }
end
