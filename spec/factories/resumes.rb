FactoryBot.define do
  factory :resume do
    association :user, factory: :user, strategy: :create
    name { FFaker::Name.name }
    template_name { 'shades_of_black' }
  end
end
