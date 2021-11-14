# frozen_string_literal: true

require 'rails_helper'

describe Validators::BoxCoordinates, type: :interactor do
  subject(:interactor) { described_class.call(params) }

  let(:params) do
    {
      ne_latitude:  ne_latitude,
      ne_longitude: ne_longitude,
      sw_latitude:  sw_latitude,
      sw_longitude: sw_longitude
    }
  end

  let(:ne_latitude)  { Faker::Address.latitude }
  let(:ne_longitude) { Faker::Address.longitude }
  let(:sw_latitude)  { Faker::Address.latitude }
  let(:sw_longitude) { Faker::Address.longitude }

  describe '.call' do
    shared_examples 'an invalid context' do
      it { is_expected.to be_a_failure }

      it 'returns an error message inside context' do
        expect(interactor.error).to eq I18n.t('errors.custom.invalid_coordinates')
      end
    end

    context 'when coordinates are present' do
      it { is_expected.to be_a_success }
    end

    context 'when ne_latitude is invalid' do
      let(:ne_latitude) { nil }

      it_behaves_like 'an invalid context'
    end

    context 'when ne_longitude is invalid' do
      let(:ne_longitude) { nil }

      it_behaves_like 'an invalid context'
    end

    context 'when sw_latitude is invalid' do
      let(:sw_latitude) { nil }

      it_behaves_like 'an invalid context'
    end

    context 'when sw_longitude is invalid' do
      let(:sw_longitude) { nil }

      it_behaves_like 'an invalid context'
    end
  end
end
