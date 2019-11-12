class BasicInfo < ApplicationRecord
  has_attached_file :photo, styles: { passport: '413x531>' }, default_url: 'https://i.pravatar.cc/300'
  belongs_to :resume

  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
  validates :name, :title, :profile_overview, presence: true

  enum gender: [:male, :female]
end
