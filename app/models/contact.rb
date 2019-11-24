class Contact < CommonNameValue
  MODEL_NAME = 'Contact'.freeze
  LABELS = [:email, :skype, :linkedin, :mobile, :telephone].freeze

  default_scope { where(type: MODEL_NAME).order(id: 'ASC') }

  belongs_to :resume

  validates :type, presence: true

  before_save do
    self.type = MODEL_NAME
  end
end
