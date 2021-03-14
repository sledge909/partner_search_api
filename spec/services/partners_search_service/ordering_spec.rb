require 'rails_helper'

RSpec.describe PartnersSearchService::Ordering do
  let(:ordering) do
    PartnersSearchService::Ordering.order(partners)
  end

  let(:partner) do
    instance_double(
      Partner,
      name: 'Flooring Co',
      operating_radius: 5,
      distance_from_customer: 5,
      rating: 5,
      address: '3 Acres Road, Manchester, M21 9EB',
    )
  end

  let(:partner2) do
    instance_double(
      Partner,
      name: 'Flooring Co',
      operating_radius: 5,
      distance_from_customer: 1,
      rating: 5,
      address: '3 Acres Road, Manchester, M21 9EB',
    )
  end

  let(:partner3) do
    instance_double(
      Partner,
      name: 'Flooring Co',
      operating_radius: 5,
      distance_from_customer: 2,
      rating: 6,
      address: '3 Acres Road, Manchester, M21 9EB',
    )
  end

  let(:partners) do
    [
      partner,
      partner2,
      partner3,
    ]
  end

  describe '#order' do
    it 'orders the partners by rating then distance' do
      expect(ordering).to eq(
        [
          partner3,
          partner2,
          partner,
        ]
      )
    end
  end
end
