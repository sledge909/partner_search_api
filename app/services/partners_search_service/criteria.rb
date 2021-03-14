require 'structural'

class PartnersSearchService
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

    def latitude
      address.split(',').first
    end

    def longitude
      address.split(',').last.strip
    end
  end
end
