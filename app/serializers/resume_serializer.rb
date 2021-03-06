class ResumeSerializer
  include FastJsonapi::ObjectSerializer

  attribute :user do |object|
    {
      is_free_user: object.user.free?
    }
  end

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

  attributes :character_references do |object|
    CharacterReferenceSerializer.new(object.character_references).serializable_hash[:data]
  end

  attribute :skills do |object|
    SkillSerializer.new(object.skills).serializable_hash[:data]
  end

  attribute :contacts do |object|
    ContactSerializer.new(object.contacts).serializable_hash[:data]
  end
end
