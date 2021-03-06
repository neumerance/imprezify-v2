require 'rails_helper'

describe Resume do
  it { should belong_to :user }
  it { should have_one :basic_info }
  it { should have_many :work_experiences }
  it { should have_many :educations }
  it { should have_many :contacts }
  it { should have_many :skills }
  it { should validate_presence_of :name }
  it { should validate_presence_of :template_name }

  describe 'calbacks' do
    let(:resume) { create(:resume) }

    it 'creates sharing code' do
      expect(resume.sharing_code).to be_present
    end
  end
end
