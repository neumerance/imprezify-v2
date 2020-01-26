class SkillSerializer < CommonNameAndValueSerializer
  attribute :rating_percentage do |object|
    object.rating_percentage
  end
end
