require 'rails_helper'

describe Education, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :title }
  it { should validate_presence_of :since }
  it { should validate_presence_of :type }
  it { should belong_to :resume }

  describe 'default scope' do
    let!(:educations) do
      create_list(:education, 2)
    end

    it 'fetches type Education only' do
      expect(Education.all.all { |e| e.type == 'Education' }).to be_truthy
    end
  end
end
