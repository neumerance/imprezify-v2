class Resume < ApplicationRecord
  belongs_to :user
  has_one :basic_info
  has_many :work_experiences
end
