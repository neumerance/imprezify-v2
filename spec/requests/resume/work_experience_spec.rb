require 'rails_helper'

feature 'Work Experience Form', :js do
  it_behaves_like 'an entity', :work_experience, 0

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
