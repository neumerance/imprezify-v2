require 'rails_helper'

describe Contact, type: :model do
  it { should belong_to :resume }
  it { should validate_presence_of :type }
  it { should validate_presence_of :value }
end
