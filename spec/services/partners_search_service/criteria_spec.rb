require 'rails_helper'

RSpec.describe PartnersSearchService::Criteria do
  let(:criteria) do
    PartnersSearchService::Criteria.create!(params)
  end

  let(:params) do
    {
      material: material,
      address: address,
      square_meters: square_meters,
      phone_number: phone_number,
    }
  end

  let(:material) { ['wood'] }
  let(:address) { '53.44007105883605,-2.27959018591222' }
  let(:square_meters) { '10' }
  let(:phone_number) { '07494451935' }

  describe '#latitude' do
    subject { criteria.latitude }
    it 'returns the provided latitude' do
      expect(subject). to eq '53.44007105883605'
    end
  end

  describe '#longitude' do
    subject { criteria.longitude }
    it 'returns the provided longitude' do
      expect(subject). to eq '-2.27959018591222'
    end
  end

  describe '#validate!' do
    subject { criteria.tap(&:validate!) }

    context 'validate material' do
      context 'when at least one material' do
        it { is_expected.to eq(criteria) }
      end

      context 'when more than one material' do
        let(:material) { ['wood', 'carpet'] }
        it { is_expected.to eq(criteria) }
      end

      context 'no materials' do
        let(:material) { [] }

        it 'raises error' do
          expect { subject }.to raise_error(ActionController::BadRequest)
        end
      end
    end

    context 'validate address' do
      context 'when address is present' do
        it { is_expected.to eq(criteria) }
      end

      context 'when address is not present' do
        let(:address) { '' }
        it 'raises error' do
          expect { subject }.to raise_error(ActionController::BadRequest)
        end
      end
    end

    context 'validate square meters' do
      context 'when square meters is present' do
        it { is_expected.to eq(criteria) }
      end

      context 'when square meters is not present' do
        let(:square_meters) { 0 }
        it 'raises error' do
          expect { subject }.to raise_error(ActionController::BadRequest)
        end
      end
    end

    context 'validate phone number' do
      context 'when phone number is present' do
        it { is_expected.to eq(criteria) }
      end

      context 'when phone number is not present' do
        let(:square_meters) { 0 }
        it 'raises error' do
          expect { subject }.to raise_error(ActionController::BadRequest)
        end
      end
    end
  end
end
