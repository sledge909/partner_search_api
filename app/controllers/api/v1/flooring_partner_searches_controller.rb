class Api::V1::FlooringPartnerSearchesController < ApplicationController

  def index
    render json: PartnerSearchesService.search(adapted_params)
  end

  def show

  end

  private

  def adapted_params
    params.merge(service: 'flooring')
  end

end
