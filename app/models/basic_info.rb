class BasicInfo < ApplicationRecord
  has_attached_file :photo, styles: { passport: '413x531#' }, default_url: '100x100.png'
  belongs_to :resume

  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

  enum gender: [:male, :female]

  def full_address
    "#{address} #{city} #{country} #{postal_code}"
  end

  def completion_percentage
    completion = 0
    %w(name title profile_overview birthdate gender).each do |f|
      completion += 20 if self.try(f.to_sym).present?
    end
    completion
  end

  def completed?
    completion_percentage == 100
  end
end
