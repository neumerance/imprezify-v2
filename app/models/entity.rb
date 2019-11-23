class Entity < ApplicationRecord
  belongs_to :resume

  has_attached_file :logo, styles: { passport: '400x400>' }, default_url: '100x100.png'
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/

  validates :type, presence: true
end
