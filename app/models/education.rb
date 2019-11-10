class Education < Entity
  MODEL_NAME = 'Education'.freeze
  default_scope { where(type: MODEL_NAME) }

  before_save do
    self.type = MODEL_NAME
  end
end
