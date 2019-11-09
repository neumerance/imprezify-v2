class Education < ApplicationRecord
  has_one :entity, as: :common_entity
  belongs_to :resume
end
