# frozen_string_literal: true

require 'rails_helper'

describe Calculate, type: :interactor do
  subject(:interactor) { described_class.call(params) }

  let(:params) do
    {
      cl_in_micrograms: cl_in_micrograms,
      pt_in_micrograms: pt_in_micrograms,
      location_type:    location_type
    }
  end

  let(:cl_in_micrograms) { 10 }
  let(:pt_in_micrograms) { 10 }

  describe '.call' do
    context 'when location_type is reservatorios' do
      let(:location_type) { 'reservatorios' }

      it { is_expected.to be_a_success }

      it { expect(interactor.calculated_cl_value).to be_within(0.00005).of(58.02176) }
      it { expect(interactor.calculated_pt_value).to be_within(0.00005).of(48.41639) }
      it { expect(interactor.iet_value).to be_within(0.00005).of(53.21907) }
    end

    context 'when location_type is rios' do
      let(:location_type) { 'rios' }

      it { is_expected.to be_a_success }

      it { expect(interactor.calculated_cl_value).to be_within(0.00005).of(70.03043) }
      it { expect(interactor.calculated_pt_value).to be_within(0.00005).of(45.89962) }
      it { expect(interactor.iet_value).to be_within(0.00005).of(57.96502) }
    end
  end
end
