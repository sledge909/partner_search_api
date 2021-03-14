class PartnersSearchService
  class Ordering
    attr_reader :partners
    private :partners

    def initialize(partners)
      @partners = partners
    end

    def self.order(partners)
      new(partners).order
    end

    def order
      partners.sort_by do |partner|
        [-partner.rating, partner.distance_from_customer]
      end
    end
  end
end
