class Resume < ApplicationRecord
  belongs_to :user
  has_one :basic_info
  has_many :work_experiences
  has_many :educations
  has_many :contacts
  has_many :skills

  validates :name, :template_name, presence: true

  before_save do
    self.template_name = self.template_name.parameterize.underscore
  end
end
