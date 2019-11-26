FactoryBot.define do
  factory :work_experience do
    name { FFaker::Company.name }
    title { FFaker::Job.title }
    since { Time.now - 3.months }
    upuntil { Time.now - 1.months }
    current { true }
    description do
      3.times.map do
        FFaker::Lorem.sentence
      end
    end
    address { FFaker::Address.street_address }
    city { FFaker::Address.city }
    country { FFaker::Address.country }
    postal_code { FFaker::Address.zip_code }
    phone { "#{FFaker::PhoneNumberSG.country_code} #{FFaker::PhoneNumberSG.mobile_number}" }
    email { FFaker::Internet.email }
    association :resume, factory: :resume, strategy: :create
  end
end
