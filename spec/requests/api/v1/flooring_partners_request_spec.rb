require 'rails_helper'

RSpec.describe "Api::V1::FlooringPartners", type: :request do
  describe '/api/v1/flooring_partners' do
    let(:parsed_response) { JSON.parse(response.body) }

    describe '#index' do
      subject { get '/api/v1/flooring_partners', params: params }

      let(:params) do
        {
          material: material,
          address: address,
          square_meters: square_meters,
          phone_number: phone_number,
        }
      end

      let(:material) { 'wood' }
      let(:address) { '53.44007105883605, -2.27959018591222' }
      let(:square_meters) { '10' }
      let(:phone_number) { '07494451935' }

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

    describe '#show' do
      subject { get "/api/v1/flooring_partners/#{id}" }

      let(:partner) { create(:partner) }
      let(:id) { partner.id }

      it 'returns a successful status' do
        subject
        expect(response).to have_http_status(:ok)
      end

      it 'returns a partner' do
        subject
        expect(parsed_response).to include(
          'id' => partner.id,
          'name' => partner.name,
          'address' => partner.address,
          'operating_radius' => partner.operating_radius,
          'rating' => partner.rating,
        )
      end
    end
  end
end
