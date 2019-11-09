FactoryBot.define do
  factory :work_experience do
    association :resume, factory: :resume, strategy: :create
    association :entity, factory: :entity, strategy: :create
  end
end
