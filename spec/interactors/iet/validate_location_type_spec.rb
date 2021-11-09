# frozen_string_literal: true

require 'rails_helper'

describe IET::ValidateLocationType, type: :interactor do
  subject(:interactor) { described_class.call(params) }

  let(:params) { { location_type: location_type } }

  let(:location_type) { IET::Measure.location_types.keys.sample }

  let(:validation_message) do
    I18n.t(
      'errors.format',
      attribute: I18n.t('activerecord.attributes.iet/measure.location_type'),
      message:   I18n.t('errors.messages.invalid')
    )
  end

  describe '.call' do
    context 'when location_type is valid' do
      it { is_expected.to be_a_success }
    end

    context 'when location_type is invalid' do
      let(:location_type) { 'invalid_type' }

      it { is_expected.to be_a_failure }

      it 'returns an error message inside context' do
        expect(interactor.error).to eq validation_message
      end
    end

    context 'when location_type is empty' do
      let(:location_type) { '' }

      it { is_expected.to be_a_failure }

      it 'returns an error message inside context' do
        expect(interactor.error).to eq validation_message
      end
    end
  end
end
