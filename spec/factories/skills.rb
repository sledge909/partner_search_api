FactoryBot.define do
  factory :skill do
    name { 'wood' }

    trait :carpet do
      name { 'carpet' }
    end
  end
end
