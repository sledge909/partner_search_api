require 'structural'

class PartnerSearchesService
  class Criteria
    include Validation
    include Structural::Model

    field :material
    field :address
    field :square_meters, type: Integer
    field :phone_number

    def self.create!(params)
      new(params).tap(&:validate!)
    end
  end
end
