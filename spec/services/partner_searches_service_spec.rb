require 'rails_helper'

RSpec.describe PartnerSearchesService do
  # let(:service) { PartnerSearchesService.new(params) }
  #
  # let(:criteria) do
  #   instance_double(
  #     PartnerSearchesService::Criteria,
  #     as_json: { criteria: 'some criteria' },
  #   )
  # end
  #
  # let(:params) do
  #   {
  #     material: material,
  #     address: address,
  #     square_meters: square_meters,
  #     phone_number: phone_number,
  #   }
  # end
  #
  # let(:material) { 'wood' }
  # let(:address) { '1 Acres Road' }
  # let(:square_meters) { '10' }
  # let(:phone_number) { '07494 451 935' }
  #
  # let(:expected_response) do
  #   {
  #     criteria: criteria,
  #     partners: serialized_partners,
  #   }
  # end
  #
  # let(:serialized_partners) do
  #   [
  #     instance_double('PartnerSerializer'),
  #     instance_double('PartnerSerializer'),
  #     instance_double('PartnerSerializer'),
  #     instance_double('PartnerSerializer'),
  #   ]
  # end
  #
  # before do
  #   allow(PartnerSerializer).to receive(:for).
  #     with(partners).
  #     and_return(serialized_partners)
  # end
  #
  # describe '#search' do
  #   subject(:search) { service.search }
  #
  #   it 'returns the results of a partner search' do
  #     expect(search).to eq(expected_response)
  #   end
  # end
end
