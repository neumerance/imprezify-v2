require 'rails_helper'

describe BasicInfo do
  it { should belong_to(:resume) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:profile_overview) }
end
