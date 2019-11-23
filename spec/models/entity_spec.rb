require 'rails_helper'

describe Entity, type: :model do
  it { should belong_to :resume }
end
