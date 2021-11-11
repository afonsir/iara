# frozen_string_literal: true

require 'rails_helper'

describe Validators::DistanceInput, type: :interactor do
  subject(:interactor) { described_class.call(params) }

  let(:params) { { distance_in_km: distance_in_km } }

  let(:distance_in_km) { Faker::Number.positive }

  let(:validation_message) do
    I18n.t(
      'errors.format',
      attribute: I18n.t('activerecord.attributes.measure.distance_in_km'),
      message:   I18n.t('errors.messages.greater_than', count: 0)
    )
  end

  describe '.call' do
    context 'when distance_in_km is positive' do
      it { is_expected.to be_a_success }
    end

    context 'when distance_in_km is nil' do
      let(:distance_in_km) { nil }

      it { is_expected.to be_a_success }
    end

    context 'when distance_in_km is negative' do
      let(:distance_in_km) { Faker::Number.negative }

      it { is_expected.to be_a_failure }

      it 'returns an error message inside context' do
        expect(interactor.error).to eq validation_message
      end
    end
  end
end
