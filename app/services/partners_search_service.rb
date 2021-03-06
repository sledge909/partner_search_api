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
    Ordering.order(partners)
  end

  def partners
    Partner.search(criteria)
  end
end
