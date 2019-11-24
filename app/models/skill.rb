class Skill < CommonNameValue
  MODEL_NAME = 'Skill'.freeze
  VALUES = [:newbie, :beginner, :skilled, :experienced, :expert].freeze

  default_scope { where(type: MODEL_NAME).order(id: 'ASC') }

  belongs_to :resume

  validates :type, presence: true

  before_save do
    self.type = MODEL_NAME
  end
end
