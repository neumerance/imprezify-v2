class BasicInfo < ApplicationRecord
  belongs_to :resume
  has_one_attached :photo

  enum gender: [:male, :female]

  def thumbnail
    return ActionView::Helpers::AssetTagHelper.image_url('100x100.png') unless photo.present?
    variant = photo.variant(
      combine_options: {
        auto_orient: true,
        gravity: "center",
        resize: "413x431^",
        crop: "413x431+0+0"
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
    %w(name title profile_overview birthdate gender).each do |f|
      completion += 20 if self.try(f.to_sym).present?
    end
    completion
  end

  def completed?
    completion_percentage == 100
  end
end
