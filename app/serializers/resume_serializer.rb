class ResumeSerializer
  include FastJsonapi::ObjectSerializer

  attribute :basic_info do |object|
    BasicInfoSerializer.new(object.basic_info).serializable_hash[:data]
  end

  attribute :work_experiences do |object|
    WorkExperienceSerializer.new(object.work_experiences).serializable_hash[:data]
  end

  attribute :educations do |object|
    EducationSerializer.new(object.educations).serializable_hash[:data]
  end

  attribute :certification_and_achievements do |object|
    CertificationAndAchievementSerializer.new(object.certification_and_achievements).serializable_hash[:data]
  end

  attribute :skills do |object|
    SkillSerializer.new(object.skills).serializable_hash[:data]
  end

  attribute :contacs do |object|
    ContactSerializer.new(object.contacts).serializable_hash[:data]
  end
end
