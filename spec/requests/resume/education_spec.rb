require 'rails_helper'

feature 'Education form', :js do
  it_behaves_like 'an entity', :education, 0
end
