# frozen_string_literal: true

require 'rails_helper'

describe Fetch::NearMeasures, type: :interactor do
  subject(:interactor) { described_class.call(params) }

  let(:params) do
    {
      latitude:       latitude,
      longitude:      longitude,
      distance_in_km: distance_in_km,
      limit:          limit
    }
  end

  let(:latitude)  { Faker::Address.latitude }
  let(:longitude) { Faker::Address.longitude }

  let(:distance_in_km) { 1 }
  let(:limit) { 10 }

  describe '.call' do
    before do
      create_list(:measure, limit, coords: Geo.point(longitude, latitude))
      create_list(:measure, limit, coords: Geo.point(longitude + 10, latitude + 10))
    end

    context 'when params are present' do
      it { is_expected.to be_a_success }

      it 'returns a list of measures' do
        expect(interactor.measures.size).to eq limit
      end
    end

    context 'when params does not match any record' do
      before do
        travel 1.day
      end

      it { is_expected.to be_a_success }

      it 'returns an empty list of measures' do
        expect(interactor.measures.size).to be_zero
      end
    end
  end
end
