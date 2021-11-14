# frozen_string_literal: true

require 'rails_helper'

describe Fetch::MeasuresWithinBox, type: :interactor do
  subject(:interactor) { described_class.call(params) }

  let(:params) do
    {
      ne_latitude:  ne_latitude,
      ne_longitude: ne_longitude,
      sw_latitude:  sw_latitude,
      sw_longitude: sw_longitude
    }
  end

  let(:ne_latitude)  { sw_latitude + 2.0 }
  let(:ne_longitude) { sw_longitude + 2.0 }
  let(:sw_latitude)  { 10.0 }
  let(:sw_longitude) { 10.0 }

  describe '.call' do
    before do
      # inside the box
      create_list(:measure, 10, coords: Geo.point(sw_longitude + 1.0, sw_latitude + 1.0))
      # outside the box
      create_list(:measure, 10, coords: Geo.point(ne_longitude + 1.0, ne_latitude + 1.0))
    end

    context 'when params are present' do
      it { is_expected.to be_a_success }

      it 'returns a list of measures' do
        expect(interactor.measures.size).to eq 10
      end
    end

    context 'when params does not match any record' do
      let(:ne_latitude)  { sw_latitude + 0.5 }
      let(:ne_longitude) { sw_longitude + 0.5 }

      it { is_expected.to be_a_success }

      it 'returns an empty list of measures' do
        expect(interactor.measures.size).to be_zero
      end
    end
  end
end
