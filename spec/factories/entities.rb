FactoryBot.define do
  factory :entity do
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
    address { FFaker::AddressUS.street_address }
    city { FFaker::Address.city }
    country { FFaker::Address.country }
    postal_code { FFaker::AddressUS.zip_code }
    contacts do
      ['3424324', '42343']
    end
  end
end
