class Entity < ApplicationRecord
  has_attached_file :logo, styles: { passport: '400x400>' }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/
  belongs_to :common_entity, polymorphic: true

  validates :name, :title, :since, presence: true
end
