require 'rails_helper'

feature 'Work Experience Form', :js do
  it_behaves_like 'an entity', :work_experience, 1
end
