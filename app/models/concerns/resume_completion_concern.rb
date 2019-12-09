module ResumeCompletionConcern
  include ActiveSupport::Concern

  def basic_info_completion
    basic_info.completion_percentage
  end

  def work_experience_completion
    return 0 unless work_experiences.any?
    work_experiences.sum(&:completion_percentage) / work_experiences.count
  end

  def education_completion
    return 0 unless educations.any?
    educations.sum(&:completion_percentage) / educations.count
  end

  def contact_completion
    return 0 unless contacts.any?
    contacts.map(&:completion_percentage).sum / contacts.count
  end

  def skill_completion
    return 0 unless skills.any?
    skills.map(&:completion_percentage).sum / skills.count
  end

  def completion_percentage
    [
      basic_info_completion,
      work_experience_completion,
      education_completion,
      contact_completion,
      skill_completion
    ].compact.sum / 5
  end
end
