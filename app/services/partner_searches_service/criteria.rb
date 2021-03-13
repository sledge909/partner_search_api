class PartnerSearchesService
  class Criteria
    include Validation
    attr_reader :params
    private :params

    def initialize(params)
      @params = params
    end

    def self.create!(params)
      new(params).tap(&:validate!)
    end
  end
end
