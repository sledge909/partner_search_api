require 'rails_helper'

RSpec.describe PartnerSearchesService do
  let(:service) { PartnerSearchesService.new(params) }

  let(:criteria) do
    instance_double(
      PartnerSearchesService::Criteria,
      as_json: { criteria: 'some criteria' },
    )
  end

  let(:params) do
    {
      material: material,
      address: address,
      square_meters: square_meters,
      phone_number: phone_number,
    }
  end

  let(:material) { 'wood' }
  let(:address) { '53.44007105883605, -2.27959018591222' }
  let(:square_meters) { '10' }
  let(:phone_number) { '07494451935' }

  let(:expected_response) do
    {
      criteria: criteria,
      partners: serialized_partners,
    }
  end

  let(:serialized_partners) do
    []
  end

  before do
    allow(PartnerSearchesService::Criteria).to receive(:create!).
       with(params).
       and_return(criteria)
  end

  describe '#search' do
    subject(:search) { service.search }

    it 'returns the results of a partner search' do
      expect(search).to eq(expected_response)
    end
  end
end
