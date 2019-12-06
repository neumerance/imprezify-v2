class Education < Entity
  MODEL_NAME = 'Education'.freeze
  SHORT_NAME = 'Education'.freeze

  default_scope { where(type: MODEL_NAME).order(created_at: 'ASC') }

  before_save do
    self.type = MODEL_NAME
  end
end
