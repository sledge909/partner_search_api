class Api::V1::FlooringPartnersController < ApplicationController

  def index
    render json: PartnersSearchService.search(adapted_params)
  end

  def show
    render json: Partner.find(id)
  end

  private

  def permitted_params
    params.permit(:address, :square_meters, :phone_number, material: [])
  end

  def adapted_params
    permitted_params.merge(service: 'flooring')
  end

  def id
    params.require(:id)
  end
end
