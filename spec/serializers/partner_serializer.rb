require 'rails_helper'

RSpec.describe PartnerSerializer do
  let(:partner_serializer) do
    PartnerSerializer.new(partner)
  end

  let(:partner) do
    instance_double(
      Partner,
      name: 'Flooring Co',
      operating_radius: 5,
      rating: 5,
      address: '3 Acres Road, Manchester, M21 9EB',
    )
  end

  describe '#serialize' do
    subject { partner_serializer.serialize }

    it 'returns a hash of partner details' do
      expect(subject).to eq(
        name: 'Flooring Co',
        operating_radius: 5,
        rating: 5,
        address: '3 Acres Road, Manchester, M21 9EB',
      )
    end
  end
end
