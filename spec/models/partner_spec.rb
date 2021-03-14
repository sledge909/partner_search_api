require 'rails_helper'

RSpec.describe Partner, type: :model do
  it 'should be a Partner class' do
    expect(subject).to be_a(Partner)
  end

  let!(:partner) { create(:partner, :with_wood_skills, services: [service]) }
  let!(:partner2) { create(:partner, :with_carpet_skills, services: [service]) }
  let(:service) { create(:service) }
  let(:material) { ['wood'] }

  let(:criteria) do
    instance_double(
      PartnerSearchesService::Criteria,
      material: material,
      service: service.name,
    )
  end

  describe '.by_service_and_skill' do
    subject { Partner.by_service_and_skill(criteria) }

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

  describe '#check_operating_radius' do
    subject { partner.within_operating_radius?(latitude, longitude) }

    let(:latitude) { '53.4395239881789' }
    let(:longitude) { '-2.279771257076178' }

    it 'returns true if client is within their operating radius' do
      expect(subject).to be_truthy
    end

    context "when client is outside of the partner's operating radius" do
      let(:latitude) { '51.55223645852829' }
      let(:longitude) { '-0.042137970623211125' }

      it 'returns false' do
        expect(subject).to be_falsey
      end
    end
  end
end
