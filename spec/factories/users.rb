FactoryBot.define do
  factory :user do
    email { FFaker::Internet.email }
    password_confirmation { 'ABC12abc' }
    password { 'ABC12abc' }
    confirmed_at { Time.now }
  end
end
