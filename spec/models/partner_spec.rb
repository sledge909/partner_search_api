require 'rails_helper'

RSpec.describe Partner, type: :model do
  it 'should be a Partner class' do
    expect(subject).to be_a(Partner)
  end

  describe '.by_service_and_skill' do
    subject { Partner.by_service_and_skill(criteria) }

    let(:partner) { FactoryBot.create(:partner) }

    let(:criteria) do
      instance_double(
        PartnerSearchesService::Criteria,
        material: 'wood',
        service: 'flooring',
      )
    end

    it 'returns all partners for a given service and skill' do
      
    end
  end
end
