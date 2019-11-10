class Entity < ApplicationRecord
  belongs_to :resume

  has_attached_file :logo, styles: { passport: '400x400>' }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/

  validates :name, :title, :since, :type, presence: true
end
