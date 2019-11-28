require 'rails_helper'

describe BasicInfo do
  it { should belong_to(:resume) }

  describe '#completion_percentage' do
    context 'incomplete' do
      let(:basic_info) { create(:basic_info, name: nil, title: nil) }

      it 'is incomplete' do
        expect(basic_info.completion_percentage).to eq 60
        expect(basic_info.completed?).to be_falsey
      end
    end

    context 'incomplete' do
      let(:basic_info) { create(:basic_info) }

      it 'is incomplete' do
        expect(basic_info.completion_percentage).to eq 100
        expect(basic_info.completed?).to be_truthy
      end
    end
  end
end
