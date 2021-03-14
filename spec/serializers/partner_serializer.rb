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
      distance_from_customer: 1,
      rating: 5,
      address: '3 Acres Road, Manchester, M21 9EB',
    )
  end

  describe '#serialize' do
    subject { partner_serializer.serialize }

    it 'returns a hash of partner details' do
      expect(subject).to eq(
        name: 'Flooring Co',
        address: '3 Acres Road, Manchester, M21 9EB',
        distance_from_customer: 1,
        operating_radius: 5,
        rating: 5,
      )
    end
  end

  describe '.serialize' do
    subject { PartnerSerializer.serialize(ordered_partners) }

    let(:ordered_partners) { [partner, partner] }
    let(:serialized_partners) do
      [
        {
          name: 'Flooring Co',
          address: '3 Acres Road, Manchester, M21 9EB',
          distance_from_customer: 1,
          operating_radius: 5,
          rating: 5,
        },
        {
          name: 'Flooring Co',
          address: '3 Acres Road, Manchester, M21 9EB',
          distance_from_customer: 1,
          operating_radius: 5,
          rating: 5,
        }
      ]
    end

    it 'serializes each partner' do
      expect(subject).to eq(serialized_partners)
    end
  end
end
