# frozen_string_literal: true

require 'rails_helper'

describe Mutations::CreateIetMeasure, type: :request do
  subject(:mutation_response) { json_response[:data][:createIetMeasure] }

  let(:cl_in_micrograms) { 10.0 }
  let(:pt_in_micrograms) { 5.0 }

  let(:query) do
    <<-GRAPHQL
      mutation {
        createIetMeasure(
          input: {
            coords: {
              latitude:   66.47878731105303
              longitude: -42.47551277602488
            }
            clInMicrograms: #{cl_in_micrograms}
            ptInMicrograms: #{pt_in_micrograms}
            locationType: reservatorios
          }
        ) {
          coords {
            latitude
            longitude
          }
          ietValue
          ietCategory
          locationType
        }
      }
    GRAPHQL
  end

  before do
    post_request
  end

  describe 'POST' do
    context 'when params are valid' do
      let(:measure_attributes) do
        {
          coords:       {
            latitude:  be_within(0.00000000000005).of(66.47878731105303),
            longitude: be_within(0.00000000000005).of(-42.47551277602488)
          },
          ietValue:     be_within(0.00005).of(51.11908),
          ietCategory:  'oligotrofico',
          locationType: 'reservatorios'
        }
      end

      it 'returns a json for created measure' do
        expect(mutation_response).to include(measure_attributes)
      end
    end

    context 'when params are invalid' do
      let(:cl_in_micrograms) { 0.0 }

      let(:error_message) do
        I18n.t('errors.custom.invalid_cl_and_pt_in_micrograms')
      end

      it 'returns errors inside the json' do
        expect(json_response[:errors]).to contain_exactly(hash_including(
          message: error_message, path: ['createIetMeasure']
        ))
      end
    end
  end

  describe 'arguments' do
    subject { described_class }

    it { is_expected.to accept_argument(:coords).of_type('CoordinatesInput!') }
    it { is_expected.to accept_argument(:cl_in_micrograms).of_type('Float!') }
    it { is_expected.to accept_argument(:pt_in_micrograms).of_type('Float!') }
    it { is_expected.to accept_argument(:location_type).of_type('Location!') }
  end

  describe 'documentation' do
    it 'returns general description' do
      expect(described_class.description).to eq(
        I18n.t('graphql.mutations.create_iet_measure.description')
      )
    end

    it 'returns coords description' do
      expect(described_class.arguments['coords'].description).to eq(
        I18n.t('graphql.mutations.create_iet_measure.arguments.coords')
      )
    end

    it 'returns cl_in_micrograms description' do
      expect(described_class.arguments['clInMicrograms'].description).to eq(
        I18n.t('graphql.mutations.create_iet_measure.arguments.cl_in_micrograms')
      )
    end

    it 'returns pt_in_micrograms description' do
      expect(described_class.arguments['ptInMicrograms'].description).to eq(
        I18n.t('graphql.mutations.create_iet_measure.arguments.pt_in_micrograms')
      )
    end

    it 'returns location_type description' do
      expect(described_class.arguments['locationType'].description).to eq(
        I18n.t('graphql.mutations.calculate_iet.arguments.location_type')
      )
    end
  end
end
