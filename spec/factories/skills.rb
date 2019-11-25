FactoryBot.define do
  factory :skill do
    name { FFaker::Skill.tech_skill }
    value { [:newbie, :beginner, :skilled, :experienced, :expert].sample }
  end
end
