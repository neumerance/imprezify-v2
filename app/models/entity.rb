class Entity < ApplicationRecord
  SHORT_NAME = 'Entity'.freeze

  belongs_to :resume

  has_one_attached :logo

  validates :type, presence: true

  def thumbnail
    return 'https://via.placeholder.com/150' unless logo.present?
    variant = logo.variant(
      combine_options: {
        auto_orient: true,
        gravity: "center",
        resize: "200x200^",
        crop: "200x200+0+0"
      }
    )
    Rails.application.routes.url_helpers.rails_representation_url(
      variant.processed
    )
  end

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
