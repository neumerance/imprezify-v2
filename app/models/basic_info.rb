class BasicInfo < ApplicationRecord
  has_attached_file :photo, styles: { passport: '413x531>' }, default_url: '100x100.png'
  belongs_to :resume

  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

  enum gender: [:male, :female]

  def full_address
    "#{address} #{city} #{country} #{postal_code}"
  end
end
