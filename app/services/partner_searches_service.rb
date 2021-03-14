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
    partners_within_radius
  end

  def partners
    Partner.by_service_and_skill(criteria)
  end

  def partners_within_radius
    partners.select do |partner|
      partner.within_operating_radius?(criteria.latitude, criteria.longitude)
    end
  end
end
