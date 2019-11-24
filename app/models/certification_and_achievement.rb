class CertificationAndAchievement < Entity
  MODEL_NAME = 'CertificationAndAchievement'.freeze
  default_scope { where(type: MODEL_NAME).order(id: 'ASC') }

  before_save do
    self.type = MODEL_NAME
  end
end
