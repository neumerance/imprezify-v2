class WorkExperience < Entity
  MODEL_NAME = 'WorkExperience'.freeze
  SHORT_NAME = 'Experience'.freeze

  default_scope { where(type: MODEL_NAME).order(created_at: 'ASC') }

  before_validation do
    self.type = MODEL_NAME
  end
end
