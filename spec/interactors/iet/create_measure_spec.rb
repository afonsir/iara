# frozen_string_literal: true

require 'rails_helper'

describe IET::CreateMeasure, type: :interactor do
  subject(:interactor) { described_class.call(params) }

  let(:params) do
    {
      iet_category:  :eutrofico,
      iet_value:     60.0,
      latitude:      Faker::Address.latitude,
      longitude:     Faker::Address.longitude,
      location_type: location_type
    }
  end

  let(:location_type) { 'rios' }

  let(:validation_message) do
    I18n.t(
      'errors.format',
      attribute: I18n.t('activerecord.attributes.iet/measure.location_type'),
      message:   I18n.t('errors.messages.blank')
    )
  end

  describe '.call' do
    context 'when params are valid' do
      it { is_expected.to be_a_success }

      it 'creates a measure record' do
        expect { interactor }.to change(IET::Measure, :count).by(1)
      end

      it 'returns a measure with expected latitude' do
        expect(interactor.measure.coords.latitude).to eq params[:latitude]
      end

      it 'returns a measure with expected longitude' do
        expect(interactor.measure.coords.longitude).to eq params[:longitude]
      end
    end

    context 'when any param is invalid' do
      let(:location_type) { '' }

      it { is_expected.to be_a_failure }

      it 'returns an error message inside context' do
        expect(interactor.error).to eq(
          I18n.t('errors.messages.model_invalid', errors: validation_message)
        )
      end
    end
  end
end
