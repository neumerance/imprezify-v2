class Contact < ApplicationRecord
  belongs_to :resume
  enum type: [:email, :skype, :linkedin, :mobile, :telephone]

  validates :type, :value, presence: true
end
