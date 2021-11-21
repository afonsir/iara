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
    I18n.t('errors.custom.invalid_coordinates')
  end

  describe '.call' do
    shared_examples 'an invalid coordinate' do
      it { is_expected.to be_a_failure }

      it 'returns an error message inside context' do
        expect(interactor.error).to eq validation_message
      end
    end

    context 'when coordinates are valid' do
      it { is_expected.to be_a_success }
    end

    context 'when latitude is invalid' do
      let(:latitude) { -91.0 }

      it_behaves_like 'an invalid coordinate'
    end

    context 'when latitude is not present' do
      let(:latitude) { nil }

      it_behaves_like 'an invalid coordinate'
    end

    context 'when longitude is invalid' do
      let(:longitude) { 181.0 }

      it_behaves_like 'an invalid coordinate'
    end

    context 'when longitude is not present' do
      let(:longitude) { nil }

      it_behaves_like 'an invalid coordinate'
    end
  end
end
