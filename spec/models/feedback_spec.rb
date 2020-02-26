require 'rails_helper'

describe Feedback do
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:subject) }
  it { is_expected.to validate_presence_of(:message) }
end
