class Resume < ApplicationRecord
  include ResumeCompletionConcern

  belongs_to :user
  has_one :basic_info, dependent: :destroy
  has_many :work_experiences, dependent: :destroy
  has_many :educations, dependent: :destroy
  has_many :contacts, dependent: :destroy
  has_many :skills, dependent: :destroy
  has_many :certification_and_achievements, dependent: :destroy
  has_many :character_references, dependent: :destroy

  validates :name, :template_name, presence: true

  accepts_nested_attributes_for :basic_info,
                                :work_experiences,
                                :educations,
                                :certification_and_achievements,
                                :character_references,
                                :contacts,
                                :skills,
                                allow_destroy: true

  before_save do
    self.template_name = self.template_name.parameterize.underscore
  end
end
