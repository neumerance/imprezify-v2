FactoryBot.define do
  factory :basic_info do
    association :resume, factory: :resume, strategy: :create
    name { FFaker::Name.name }
    title { FFaker::Job.title }
    profile_overview { FFaker::Lorem.paragraph }
    birthdate { '1987-04-15' }
    nationality { 'Filipino' }
    height { `5' 4"` }
    gender { [0, 1].sample }
    religion { 'Christian' }
    address { FFaker::Address.street_address }
    city { FFaker::Address.city }
    country { FFaker::Address.country }
    postal_code { FFaker::Address.zip_code }
  end
end
