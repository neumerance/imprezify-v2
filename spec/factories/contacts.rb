FactoryBot.define do
  factory :contact do
    name { [:email, :skype, :linkedin, :mobile, :telephone].sample }
    value { FFaker::Lorem.word }
  end
end
