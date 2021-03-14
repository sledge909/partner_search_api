class Api::V1::FlooringPartnersController < ApplicationController

  def index
    render json: PartnersSearchService.search(adapted_params)
  end

  def show

  end

  private

  def adapted_params
    params.merge(service: 'flooring')
  end

end
