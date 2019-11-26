FactoryBot.define do
  factory :character_reference do
    name { FFaker::Name.name }
    title { FFaker::Job.title }
    address { FFaker::Address.street_address }
    city { FFaker::Address.city }
    country { FFaker::Address.country }
    postal_code { FFaker::Address.zip_code }
    phone { "#{FFaker::PhoneNumberSG.country_code} #{FFaker::PhoneNumberSG.mobile_number}" }
    email { FFaker::Internet.email }
    association :resume, factory: :resume, strategy: :create
  end
end
