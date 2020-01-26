class BasicInfoSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :title, :profile_overview, :birthdate,
             :nationality, :gender, :height, :religion,
             :address, :city, :country, :postal_code, :full_address

  attribute :photo do |object|
    object.photo(:passport)
  end
end
