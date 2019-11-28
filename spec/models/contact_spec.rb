require 'rails_helper'

describe Contact, type: :model do
  it { should belong_to :resume }
  it { should validate_presence_of :type }

  describe '#completed' do
    let(:contact) { create(:contact) }

    it 'is completed' do
      expect(contact.completed?).to be_truthy
    end
  end
end
