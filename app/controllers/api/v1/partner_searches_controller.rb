class Api::V1::PartnerSearchesController < ApplicationController

  def index
    render json: PartnerSearchService.search(params)
  end

  def show

  end
end
