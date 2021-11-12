# frozen_string_literal: true

require 'rails_helper'

describe FetchNearMeasuresOrganizer, type: :interactor do
  subject(:organizer) { described_class.call(params) }

  let(:params) do
    {
      latitude:  Faker::Address.latitude,
      longitude: Faker::Address.longitude
    }
  end

  describe '.organized' do
    let(:interactors) do
      [
        Validators::Coordinates,
        Validators::DistanceInput,
        Fetch::NearMeasures
      ]
    end

    it { expect(described_class.organized).to eq interactors }
  end

  describe '.call' do
    it { is_expected.to be_a_success }
  end
end
