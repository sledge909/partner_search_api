class PartnerSerializer
  attr_reader :partner
  private :partner

  def initialize(partner)
    @partner = partner
  end

  def self.serialize(ordered_partners)
    ordered_partners.map { |partner| new(partner).serialize }
  end

  def serialize
    {
      name: partner.name,
      address: partner.address,
      distance_from_customer: partner.distance_from_customer,
      operating_radius: partner.operating_radius,
      rating: partner.rating,
    }
  end
end
