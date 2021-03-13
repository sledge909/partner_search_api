class PartnerSearchesService
  module Validation
    def validate!
      validate_material!
      # validate_address!
      # validate_square_meters!
      # validate_phone_number!
    end

    def valid_materials
      %w[wood carpet tiles]
    end

    def validate_material!
      raise_bad_request(:material) unless valid_material?
    end

    def valid_material?
      valid_materials.include?(material)
    end

    def raise_bad_request(field_name, message = '')
      fail ActionController::BadRequest,
        "Invalid parameter '#{field_name}' with value '#{data[field_name]}'. #{message}"
    end

  end
end