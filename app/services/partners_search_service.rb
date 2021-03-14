class PartnersSearchService
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
    PartnerSerializer.serialize(ordered_partners)
  end

  def ordered_partners
    partners.sort_by do |partner|
      [partner.distance_from_customer, partner.rating]
    end
  end

  def partners
    Partner.search(criteria)
  end
end
