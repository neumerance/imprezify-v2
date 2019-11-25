class EntitySerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :title, :since, :upuntil, :current, :description,
             :address, :city, :country, :postal_code, :contacts

  attribute :logo do |object|
    object.logo.url
  end
end
