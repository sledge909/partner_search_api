class Api::V1::FlooringPartnerSearchesController < ApplicationController

  def index
    render json: PartnerSearchesService.search(params)
  end

  def show

  end
end
