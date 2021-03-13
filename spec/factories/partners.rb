FactoryBot.define do
  factory :partner do
    name { 'Flooring Ltd' }
    address { '1 Acres Road' }
    operating_radius { 5 }
    rating { 5 }

    trait :with_flooring_services do
      name { 'Flooring Co' }

      after(:create) do |partner|
        partner.services << FactoryBot.create(:service)
        partner.skills << FactoryBot.create(:skill, service: Service.last)
      end
    end
  end
end
