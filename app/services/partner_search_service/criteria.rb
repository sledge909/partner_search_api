class PartnerSearchService
  class Criteria
    include Validation

    def initialize(params)
      @params = params
    end

    def self.create!(params)
      new(params).tap(&:validate!)
    end

  end
end
