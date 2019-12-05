class Contact < CommonNameValue
  MODEL_NAME = 'Contact'.freeze
  LABELS = [:email, :skype, :linkedin, :mobile, :telephone].freeze
  ICONS  = ['fas fa-at', 'fab fa-skype', 'fab fa-linkedin', 'fas fa-mobile', 'fas fa-phone-alt']

  default_scope { where(type: MODEL_NAME).order(created_at: 'ASC') }

  belongs_to :resume

  validates :type, presence: true

  before_save do
    self.type = MODEL_NAME
  end

  def name_to_icon
    return unless name.present?
    index = LABELS.index(name.to_sym)
    ICONS[index]
  end
end
