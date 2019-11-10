require 'rails_helper'

describe Resume do
  it { should belong_to :user }
  it { should have_one :basic_info }
  it { should have_many :work_experiences }
  it { should have_many :educations }
  it { should have_many :contacts }
end
