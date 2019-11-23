require 'rails_helper'

describe WorkExperience, type: :model do
  it { should validate_presence_of :type }
  it { should belong_to :resume }

  describe 'default scope' do
    let!(:work_experience) do
      create_list(:work_experience, 2)
    end

    it 'fetches type WorkExperience only' do
      expect(WorkExperience.all.all { |e| e.type == 'WorkExperience' }).to be_truthy
    end
  end
end
