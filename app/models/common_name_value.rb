class CommonNameValue < ApplicationRecord
  def completed?
    name.present? && value.present?
  end

  def completion_percentage
    %w(name value).map { |x| self.try(x.to_sym).present? ? 50 : 0 }.sum
  end
end
