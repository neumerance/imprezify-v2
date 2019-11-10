require 'rails_helper'

describe Skill, type: :model do
  it { should belong_to :resume }
end
