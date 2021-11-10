# frozen_string_literal: true

require 'rails_helper'

describe CalculateOrganizer, type: :interactor do
  subject(:organizer) { described_class.call(params) }

  let(:params) do
    {
      cl_in_micrograms: 10,
      pt_in_micrograms: 10,
      location_type:    location_type
    }
  end

  let(:location_type) { Measure.location_types.keys.sample }

  describe '.organized' do
    let(:interactors) do
      [
        ValidateLocationType,
        Validators::CalculateInput,
        Calculate,
        DefineCategory
      ]
    end

    it { expect(described_class.organized).to eq interactors }
  end

  describe '.call' do
    it { is_expected.to be_a_success }
  end
end
