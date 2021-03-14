FactoryBot.define do
  factory :partner do
    name { 'Flooring Ltd' }
    address { '3 Acres Road, Manchester, M21 9EB' }
    operating_radius { 5 }
    rating { 5 }


    trait :with_wood_skills do
      name { 'Wood Co' }

      after(:create) do |partner|
        service = Service.find_or_create_by(name: 'flooring')
        partner.services << service
        partner.skills << FactoryBot.create(:skill, service: service)
      end
    end

    trait :with_carpet_skills do
      name { 'Carpet Co' }

      after(:create) do |partner|
        service = Service.find_or_create_by(name: 'flooring')
        partner.services << service
        partner.skills << FactoryBot.create(:skill, :carpet, service: service)
      end
    end

    trait :with_tile_skills do
      name { 'Tile Co' }

      after(:create) do |partner|
        service = Service.find_or_create_by(name: 'flooring')
        partner.services << service
        partner.skills << FactoryBot.create(:skill, :tiles, service: service)
      end
    end
  end
end
