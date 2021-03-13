require 'rails_helper'

RSpec.describe "Api::V1::FlooringPartnerSearches", type: :request do
  describe '/api/v1/flooring_partner_searches' do
    subject { get '/api/v1/flooring_partner_searches', params: params }
    let(:parsed_response) { JSON.parse(response.body) }

    let(:params) do
      {
        material: material,
        address: address,
        square_meters: square_meters,
        phone_number: phone_number,
      }
    end

    let(:material) { 'wood' }
    let(:address) { '1 Acres Road' }
    let(:square_meters) { '10' }
    let(:phone_number) { '07494 451 935' }

    it 'returns a successful status' do
      subject
      expect(response).to have_http_status(:ok)
    end

    it 'returns partner results' do
      subject
      expect(parsed_response).to include('criteria', 'partners')
    end

    context 'when invalid params are sent' do
      let(:material) { 'grass' }

      it 'raises an argument error' do
        expect { subject }.to raise_error(
          ActionController::BadRequest
        )
      end
    end
  end
end
