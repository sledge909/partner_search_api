FactoryBot.define do
  factory :skill do
    name { 'wood' }

    trait :carpet do
      name { 'carpet' }
    end

    trait :tile do
      name { 'tile' }
    end
  end
end
