class BasicInfoSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :title, :profile_overview, :birthdate,
             :nationality, :gender, :height, :religion,
             :address, :city, :country, :postal_code
end
