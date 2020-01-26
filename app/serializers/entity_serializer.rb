class EntitySerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :title, :current,
             :description, :email, :phone,
             :full_address, :city, :country,
             :postal_code

  attribute :logo do |object|
    object.logo(:thumb)
  end

  attribute :since do |object|
    object.since ? object.since.strftime('%b %Y') : ''
  end

  attribute :upuntil do |object|
    object.upuntil ? object.upuntil.strftime('%b %Y') : 'present'
  end
end
