FactoryBot.define do
  factory :partner do
    name { 'Flooring Ltd' }
    address { '1 Acres Road' }
    operating_radius { 5 }
    rating { 5 }

    trait :with_wood_skills do
      name { 'Wood Co' }

      after(:create) do |partner|
        partner.skills << FactoryBot.create(:skill, service: FactoryBot.create(:service))
      end
    end

    trait :with_carpet_skills do
      name { 'Carpet Co' }

      after(:create) do |partner|
        partner.skills << FactoryBot.create(:skill, :carpet, service: FactoryBot.create(:service))
      end
    end
  end
end
