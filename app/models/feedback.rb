class Feedback
  include ActiveModel::AttributeAssignment
  include ActiveModel::Validations
  attr_accessor :email, :subject, :message, :rating

  validates :email, :subject, :message, presence: true
  validates_format_of :email, with: /\A([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})\z/i
  validates :rating, inclusion: { in: 1..5 }, if: ->() { rating.present? }
end
