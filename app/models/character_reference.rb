class CharacterReference < Entity
  MODEL_NAME = 'CharacterReference'.freeze
  default_scope { where(type: MODEL_NAME).order(id: 'ASC') }

  before_save do
    self.type = MODEL_NAME
  end

  def completion_percentage
    completion = 0
    %w(name title email phone).each do |f|
      completion += 25 if self.try(f.to_sym).present?
    end
    completion
  end

  def completed?
    completion_percentage == 100
  end
end
