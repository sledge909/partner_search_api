class Api::V1::PartnerSearchesController < ApplicationController

  def index
    render json: PartnerSearchesService.search(params)
  end

  def show

  end
end
