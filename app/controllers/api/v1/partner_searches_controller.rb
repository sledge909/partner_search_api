class Api::V1::PartnerSearchesController < ApplicationController
  # include ActionController::HttpAuthentication::Basic::ControllerMethods
  # http_basic_authenticate_with name: ENV['API_USER'],
                               # password: ENV['API_PASSWORD']

  def index
    render json: PartnerSearchService.search(params)
  end

  def show

  end
end
