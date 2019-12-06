class Skill < CommonNameValue
  MODEL_NAME = 'Skill'.freeze
  SHORT_NAME = 'Skill'.freeze

  VALUES = [:newbie, :beginner, :skilled, :experienced, :expert].freeze

  default_scope { where(type: MODEL_NAME).order(created_at: 'ASC') }

  belongs_to :resume

  validates :type, presence: true

  before_save do
    self.type = MODEL_NAME
  end

  def rating
    return unless value.present?
    VALUES.index(value.to_sym) + 1
  end

  def rating_percentage
    return unless value.present?
    rating * 20
  end
end
