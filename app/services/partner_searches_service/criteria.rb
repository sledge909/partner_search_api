require 'structural'

class PartnerSearchesService
  class Criteria
    include Validation
    include Structural::Model

    field :address
    field :material, default: []
    field :phone_number
    field :service
    field :square_meters, type: Integer

    def self.create!(params)
      new(params).tap(&:validate!)
    end
  end
end
