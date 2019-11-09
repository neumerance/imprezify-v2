class WorkExperience < ApplicationRecord
  belongs_to :resume
  has_one :entity, as: :common_entity
end
