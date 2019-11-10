FactoryBot.define do
  factory :resume do
    association :user, factory: :user, strategy: :create
    name { FFaker::Name.name }
  end
end
