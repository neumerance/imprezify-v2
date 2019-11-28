FactoryBot.define do
  factory :contact do
    association :resume, factory: :resume, strategy: :create
    name { [:email, :skype, :linkedin, :mobile, :telephone].sample }
    value { FFaker::Lorem.word }
  end
end
