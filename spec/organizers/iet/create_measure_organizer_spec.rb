# frozen_string_literal: true

require 'rails_helper'

describe IET::CreateMeasureOrganizer, type: :interactor do
  subject(:organizer) { described_class.call(params) }

  let(:params) do
    {
      cl_in_micrograms: cl_in_micrograms,
      pt_in_micrograms: pt_in_micrograms,
      location_type:    location_type
    }
  end

  let(:location_type) { IET::Measure.location_types.keys.sample }

  let(:cl_in_micrograms) { 10 }
  let(:pt_in_micrograms) { 10 }

  describe '.organized' do
    let(:interactors) do
      [
        IET::CalculateOrganizer,
        IET::CreateMeasure
      ]
    end

    it { expect(described_class.organized).to eq interactors }
  end

  describe '.call' do
    it { is_expected.to be_a_success }
  end
end
