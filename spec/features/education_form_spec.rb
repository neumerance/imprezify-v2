require 'rails_helper'

feature 'Education Form', :js do
  it_behaves_like 'an entity', :education, 1
end
