# frozen_string_literal: true

require 'rails_helper'

describe Validators::Coordinates, type: :interactor do
  subject(:interactor) { described_class.call(params) }

  let(:params) do
    {
      latitude:  latitude,
      longitude: longitude
    }
  end

  let(:latitude)  { Faker::Address.latitude }
  let(:longitude) { Faker::Address.longitude }

  let(:validation_message) do
    I18n.t(
      'errors.format',
      attribute: I18n.t('activerecord.attributes.measure.coords'),
      message:   I18n.t('errors.messages.blank')
    )
  end

  describe '.call' do
    context 'when coordinates are present' do
      it { is_expected.to be_a_success }
    end

    context 'when latitude is invalid' do
      let(:latitude) { nil }

      it { is_expected.to be_a_failure }

      it 'returns an error message inside context' do
        expect(interactor.error).to eq validation_message
      end
    end

    context 'when longitude is invalid' do
      let(:longitude) { nil }

      it { is_expected.to be_a_failure }

      it 'returns an error message inside context' do
        expect(interactor.error).to eq validation_message
      end
    end
  end
end
