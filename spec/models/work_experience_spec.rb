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

  describe '#completion_percentage' do
    context 'incomplete' do
      let(:experience) { create(:work_experience, title: nil, since: nil) }

      it 'is incomplete' do
        expect(experience.completion_percentage).to eq 60
        expect(experience.completed?).to be_falsey
      end
    end

    context 'incomplete' do
      let(:experience) { create(:work_experience) }

      it 'is incomplete' do
        expect(experience.completion_percentage).to eq 100
        expect(experience.completed?).to be_truthy
      end
    end
  end
end
