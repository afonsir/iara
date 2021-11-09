# frozen_string_literal: true

require 'rails_helper'

describe IET::ValidateType, type: :interactor do
  subject(:interactor) { described_class.call(type: type) }

  let(:type) { IET::Measure.types.keys.sample }

  let(:validation_message) do
    I18n.t(
      'errors.format',
      attribute: I18n.t('activerecord.attributes.iet/measure.type'),
      message:   I18n.t('errors.messages.invalid')
    )
  end

  describe '.call' do
    context 'when type is valid' do
      it { is_expected.to be_a_success }
    end

    context 'when type is invalid' do
      let(:type) { 'invalid_type' }

      it { is_expected.to be_a_failure }

      it 'returns an error message inside context' do
        expect(interactor.error).to eq validation_message
      end
    end

    context 'when type is empty' do
      let(:type) { '' }

      it { is_expected.to be_a_failure }

      it 'returns an error message inside context' do
        expect(interactor.error).to eq validation_message
      end
    end
  end
end
