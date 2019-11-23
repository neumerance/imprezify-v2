require 'rails_helper'

describe BasicInfo do
  it { should belong_to(:resume) }
end
