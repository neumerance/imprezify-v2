require 'rails_helper'

describe Education, type: :model do
  it { should belong_to :resume }
end
