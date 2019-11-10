class Resume < ApplicationRecord
  belongs_to :user
  has_one :basic_info
  has_many :work_experiences
  has_many :educations
  has_many :contacts
  has_many :skills
end
