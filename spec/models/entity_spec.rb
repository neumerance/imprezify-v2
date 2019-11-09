require 'rails_helper'

describe Entity, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :title }
  it { should validate_presence_of :since }
end
