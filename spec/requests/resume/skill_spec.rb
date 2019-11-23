require 'rails_helper'

feature 'Skill Form', :js do
  it_behaves_like 'a common name and value', :skill, 0
end
