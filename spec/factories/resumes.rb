FactoryBot.define do
  factory :resume do
    association :user, factory: :user, strategy: :create
    name { FFaker::Name.name }
    template_name { 'shades_of_black' }
  end

  trait :complete_resume do
    after :create do |resume|
      create(:basic_info, resume: resume)
      create_list(:work_experience, 3, resume: resume)
      create_list(:education, 3, resume: resume)
      create_list(:certification_and_achievement, 3, resume: resume)
      create_list(:contact, 3, resume: resume)
      create_list(:skill, 3, resume: resume)
      create_list(:character_reference, 3, resume: resume)
    end
  end
end
