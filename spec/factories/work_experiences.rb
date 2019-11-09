FactoryBot.define do
  factory :work_experience do
    association :resume, factory: :resume, strategy: :create
  end
end
