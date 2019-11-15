class Entity < ApplicationRecord
  belongs_to :resume

  has_attached_file :logo, styles: { passport: '400x400>' }, default_url: 'http://via.placeholder.com/300x300'
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/

  validates :name, :title, :since, :type, presence: true
end
