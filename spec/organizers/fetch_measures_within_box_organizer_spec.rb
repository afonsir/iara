# frozen_string_literal: true

require 'rails_helper'

describe FetchMeasuresWithinBoxOrganizer, type: :interactor do
  subject(:organizer) { described_class.call(params) }

  let(:params) do
    {
      ne_latitude:  Faker::Address.latitude,
      ne_longitude: Faker::Address.longitude,
      sw_latitude:  Faker::Address.latitude,
      sw_longitude: Faker::Address.longitude
    }
  end

  describe '.organized' do
    let(:interactors) do
      [
        Validators::BoxCoordinates,
        Fetch::MeasuresWithinBox,
        Fetch::Limit
      ]
    end

    it { expect(described_class.organized).to eq interactors }
  end

  describe '.call' do
    it { is_expected.to be_a_success }
  end
end
