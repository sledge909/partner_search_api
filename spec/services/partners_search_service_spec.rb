require 'rails_helper'

RSpec.describe PartnersSearchService do
  let(:service) { PartnersSearchService.new(params) }

  let(:params) do
    {
      material: material,
      address: address,
      square_meters: square_meters,
      phone_number: phone_number,
      service: requested_service
    }
  end

  let(:criteria) do
    instance_double(
      PartnersSearchService::Criteria,
      material: material,
      latitude: latitude,
      longitude: longitude,
      service: requested_service,
    )
  end

  let(:latitude) { '53.44007105883605' }
  let(:longitude) { '-2.27959018591222' }
  let(:requested_service) { 'flooring' }
  let(:material) { 'wood' }
  let(:address) { '53.44007105883605, -2.27959018591222' }
  let(:square_meters) { '10' }
  let(:phone_number) { '07494451935' }

  let(:serializer) do
    instance_double(
      PartnerSerializer,
      serialize: serialized_data
    )
  end

  let(:serialized_data) { { partner: 'partner' } }
  let(:serialized_partners) do
    [
      serializer
    ]
  end

  let(:partner) do
    instance_double(
      Partner,
      name: 'Flooring Co',
      distance_from_customer: 1,
      operating_radius: 5,
      rating: 5,
      address: '3 Acres Road, Manchester, M21 9EB',
    )
  end

  let(:partners) do
    [
      partner
    ]
  end

  let(:ordered_partners) do
    partners
  end

  let(:expected_response) do
    {
      criteria: criteria,
      partners: serialized_partners,
    }
  end

  before do
    allow(PartnersSearchService::Criteria).to receive(:create!).
       with(params).
       and_return(criteria)
    allow(Partner).to receive(:search).
      with(criteria).
      and_return(partners)
    allow(PartnerSerializer).to receive(:serialize).
      with(ordered_partners).and_return(serialized_partners)
  end

  describe '#search' do
    subject(:search) { service.search }

    it 'returns the results of a partner search' do
      expect(search).to eq(expected_response)
    end
  end
end
