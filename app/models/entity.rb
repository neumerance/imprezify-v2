class Entity < ApplicationRecord
  belongs_to :resume

  has_attached_file :logo, styles: { passport: '400x400>' }, default_url: '100x100.png'
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/

  validates :type, presence: true

  def full_address
    "#{address} #{city} #{country} #{postal_code}"
  end

  def completion_percentage
    completion = 0
    %w(name title since description).each do |f|
      completion += 20 if self.try(f.to_sym).present?
    end
    completion += 20 if upuntil.present? || current == true
    completion
  end

  def completed?
    completion_percentage == 100
  end
end
