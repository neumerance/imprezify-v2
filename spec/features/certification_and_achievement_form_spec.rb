require 'rails_helper'

feature 'Certification and Achievement Form', :js do
  it_behaves_like 'an entity', :certification_and_achievement, 1
end
