# frozen_string_literal: true

require 'rails_helper'

describe Validators::CalculateInput, type: :interactor do
  subject(:interactor) { described_class.call(params) }

  let(:params) do
    {
      cl_in_micrograms: cl_in_micrograms,
      pt_in_micrograms: pt_in_micrograms
    }
  end

  let(:cl_in_micrograms) { 10.0 }
  let(:pt_in_micrograms) { 10.0 }

  let(:validation_message) do
    I18n.t('errors.custom.invalid_cl_and_pt_in_micrograms', count: 0)
  end

  describe '.call' do
    context 'when cl_in_micrograms and pt_in_micrograms values are valid' do
      it { is_expected.to be_a_success }
    end

    context 'when cl_in_micrograms is invalid' do
      let(:cl_in_micrograms) { 0.0 }

      it { is_expected.to be_a_failure }

      it 'returns an error message inside context' do
        expect(interactor.error).to eq validation_message
      end
    end

    context 'when pt_in_micrograms is invalid' do
      let(:pt_in_micrograms) { -10.0 }

      it { is_expected.to be_a_failure }

      it 'returns an error message inside context' do
        expect(interactor.error).to eq validation_message
      end
    end
  end
end
