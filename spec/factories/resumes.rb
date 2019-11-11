FactoryBot.define do
  factory :resume do
    association :user, factory: :user, strategy: :create
    name { FFaker::Name.name }
    template_name { FFaker::Name.name.parameterize.underscore }
  end
end
