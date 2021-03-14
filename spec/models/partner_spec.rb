require 'rails_helper'

RSpec.describe Partner, type: :model do
  it 'should be a Partner class' do
    expect(subject).to be_a(Partner)
  end

  let(:service) { create(:service) }
  let!(:partner) { create(:partner, :with_wood_skills) }
  let!(:partner2) { create(:partner, :with_carpet_skills) }
  let(:material) { ['wood'] }
  let(:latitude) { '53.43954955159376' }
  let(:longitude) { '-2.2797390705679983' }

  let(:criteria) do
    instance_double(
      PartnersSearchService::Criteria,
      material: material,
      latitude: latitude,
      longitude: longitude,
      service: service.name,
    )
  end

  describe '.search' do
    subject { Partner.search(criteria) }

    it 'returns all partners for the given criteria' do
      expect(subject).to eq([partner])
    end

    context 'when a combination of materials is requested' do
      let!(:partner3) { create(:partner, :with_tile_skills) }
      let(:material) { ['wood', 'carpet'] }

      it 'returns all partners with skills in those materials' do
        expect(subject).to eq([partner, partner2])
      end
    end
  end

  describe '#within_operating_radius' do
    subject { partner.within_operating_radius?(latitude, longitude) }

    it 'returns true if client is within the operating radius' do
      expect(subject).to be_truthy
    end

    context 'when client is outside of the operating radius' do
      let(:latitude) { '51.55223645852829' }
      let(:longitude) { '-0.042137970623211125' }

      it 'returns false' do
        expect(subject).to be_falsey
      end
    end
  end
end
