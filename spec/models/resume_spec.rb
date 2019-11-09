require 'rails_helper'

describe Resume do
  it { should belong_to(:user) }
  it { should have_one(:basic_info) }
end
