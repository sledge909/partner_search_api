FactoryBot.define do
  factory :skill do
    name { 'wood' }

    trait :carpet do
      name { 'carpet' }
    end

    trait :tiles do
      name { 'tiles' }
    end
  end
end
