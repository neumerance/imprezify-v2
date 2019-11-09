require 'rails_helper'

describe WorkExperience, type: :model do
  it { should belong_to :resume }
end
