class Resume < ApplicationRecord
  belongs_to :user
  has_one :basic_info, dependent: :destroy
  has_many :work_experiences, dependent: :destroy
  has_many :educations, dependent: :destroy
  has_many :contacts, dependent: :destroy
  has_many :skills, dependent: :destroy

  validates :name, :template_name, presence: true

  accepts_nested_attributes_for :basic_info,
                                :work_experiences,
                                :educations,
                                :contacts,
                                :skills,
                                allow_destroy: true

  before_save do
    self.template_name = self.template_name.parameterize.underscore
  end
end
