# frozen_string_literal: true

require 'rails_helper'

describe Fetch::Limit, type: :interactor do
  subject(:interactor) { described_class.call(params) }

  let(:params) do
    {
      measures: measures,
      limit:    limit
    }
  end

  let(:measures)  { Measure.near(Geo.point(longitude, latitude)) }
  let(:latitude)  { Faker::Address.latitude }
  let(:longitude) { Faker::Address.longitude }

  let(:limit) { 5 }

  describe '.call' do
    before do
      create_list(:measure, 10, coords: Geo.point(longitude, latitude))
    end

    context 'when limit are present' do
      it { is_expected.to be_a_success }

      it 'returns a list of measures with limit' do
        expect(interactor.measures.size).to eq limit
      end

      it 'returns total_count equals of all measures' do
        expect(interactor.total_count).to eq 10
      end
    end

    context 'when limit are not present' do
      let(:limit) { nil }

      it { is_expected.to be_a_success }

      it 'returns a list of all measures' do
        expect(interactor.measures.size).to eq 10
      end

      it 'returns total_count equals of all measures' do
        expect(interactor.total_count).to eq 10
      end
    end
  end
end
