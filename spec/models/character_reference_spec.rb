require 'rails_helper'

describe CharacterReference, type: :model do
  it { should validate_presence_of :type }
  it { should belong_to :resume }

  describe 'default scope' do
    let!(:character_reference) do
      create_list(:character_reference, 2)
    end

    it 'fetches type CharacterReference only' do
      expect(CharacterReference.all.all { |e| e.type == 'CharacterReference' }).to be_truthy
    end
  end

  describe '#completion_percentage' do
    context 'incomplete' do
      let(:character_reference) { create(:character_reference, name: nil, title: nil) }

      it 'is incomplete' do
        expect(character_reference.completion_percentage).to eq 50
        expect(character_reference.completed?).to be_falsey
      end
    end

    context 'incomplete' do
      let(:character_reference) { create(:character_reference) }

      it 'is incomplete' do
        expect(character_reference.completion_percentage).to eq 100
        expect(character_reference.completed?).to be_truthy
      end
    end
  end
end
