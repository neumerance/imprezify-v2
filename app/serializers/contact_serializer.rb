class ContactSerializer < CommonNameAndValueSerializer
  attribute :icon do |object|
    object.name_to_icon
  end
end
