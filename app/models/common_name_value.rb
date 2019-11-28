class CommonNameValue < ApplicationRecord
  def completed?
    name.present? && value.present?
  end
end
