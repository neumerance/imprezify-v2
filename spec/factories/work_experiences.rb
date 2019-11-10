FactoryBot.define do
  factory :work_experience do
    name { FFaker::Company.name }
    title { FFaker::Job.title }
    since { Time.now - 7.months }
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
    contacts do
      ['3424324', '42343']
    end
    association :resume, factory: :resume, strategy: :create
  end
end
