class PartnersSearchService
  module Validation
    def validate!
      validate_material!
      validate_address!
      validate_square_meters!
      validate_phone_number!
    end

    def valid_materials
      %w[wood carpet tiles]
    end

    def valid_material?
      (valid_materials & material).any?
    end

    def validate_material!
      raise_bad_request(:material) unless valid_material?
    end

    def validate_address!
      raise_bad_request(:address) if latitude.blank? || longitude.blank?
    end

    def validate_square_meters!
      raise_bad_request(:square_meters) if square_meters.zero? || square_meters.blank?
    end

    def validate_phone_number!
      raise_bad_request(:phone_number) if phone_number.blank?
    end

    def raise_bad_request(field_name, message = '')
      fail ActionController::BadRequest,
        "Invalid parameter '#{field_name}' with value '#{data[field_name]}'. #{message}"
    end
  end
end
