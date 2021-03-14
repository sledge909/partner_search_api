class Api::V1::FlooringPartnersController < ApplicationController

  def index
    render json: PartnersSearchService.search(adapted_params)
  end

  def show
    render json: Partner.find(id)
  end

  private

  def adapted_params
    params.merge(service: 'flooring')
  end

  def id
    params.require(:id)
  end
end
