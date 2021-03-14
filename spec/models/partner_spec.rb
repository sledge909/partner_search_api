require 'rails_helper'

RSpec.describe Partner, type: :model do
  it 'should be a Partner class' do
    expect(subject).to be_a(Partner)
  end

  describe '.by_service_and_skill' do
    subject { Partner.by_service_and_skill(criteria) }

    let(:partner) { create(:partner, :with_wood_skills, services: [service]) }
    let(:partner2) { create(:partner, :with_carpet_skills, services: [service]) }
    let(:service) { create(:service) }
    let(:material) { ['wood'] }

    let(:criteria) do
      instance_double(
        PartnerSearchesService::Criteria,
        material: material,
        service: service.name,
      )
    end

    it 'returns all partners for a given service and material' do
      expect(subject).to eq([partner])
    end

    context 'when a combination of materials is requested' do
      let(:partner2) { create(:partner, :with_carpet_skills, services: [service]) }
      let(:material) { ['wood', 'carpet'] }

      it 'returns all partners with skills in those materials' do
        expect(subject).to eq([partner, partner2])
      end
    end
  end
end
