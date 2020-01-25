require 'rails_helper'

feature 'Skills Form', :js do
  it_behaves_like 'common name and value', :skills, 1, {
    name: {
      type: :input,
      value: 'farming'
    },
    value: {
      type: :select,
      value: 'Expert'
    }
  }
end
