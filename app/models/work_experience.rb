class WorkExperience < Entity
  MODEL_NAME = 'WorkExperience'.freeze
  default_scope { where(type: MODEL_NAME).order(created_at: 'ASC') }

  before_save do
    self.type = MODEL_NAME
  end
end
