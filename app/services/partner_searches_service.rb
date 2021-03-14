class PartnerSearchesService
  attr_reader :params
  private :params

  def initialize(params)
    @params = params
  end

  def self.search(params)
    new(params).search
  end

  def search
    {
      criteria: criteria,
      partners: serialized_partners,
    }
  end

  private

  def criteria
    @criteria ||= Criteria.create!(params)
  end

  def serialized_partners
    sorted_partners.map do |partner|
      partner_serializer.serialize(partner)
    end
  end

  def partner_serializer
    PartnerSerializer
  end

  def partners
    Partner.by_service_and_skill(criteria)
  end

  def sorted_partners
    binding.pry
    partners_within_radius.sort_by {|partner| [partner.distance_from_customer, partner.rating] }
  end

  def partners_within_radius
    partners.select do |partner|
      partner.within_operating_radius?(criteria.latitude, criteria.longitude)
    end
  end
end
