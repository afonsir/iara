# frozen_string_literal: true

require 'rails_helper'

describe Queries::FetchMeasuresWithinBox, type: :request, authenticate: true do
  subject(:query_reponse) { json_response[:data][:fetchMeasuresWithinBox] }

  let(:latitude)  { Faker::Address.latitude }
  let(:longitude) { Faker::Address.longitude }

  let(:limit) { 5 }

  let(:query) do
    <<-GRAPHQL
      query {
        fetchMeasuresWithinBox (
          swCoords: {
            latitude:  #{latitude}
            longitude: #{longitude}
          }
          neCoords: {
            latitude:  #{latitude + 1.0}
            longitude: #{longitude + 1.0}
          }
          limit: 3
        ) {
          totalCount
          measures {
            id
            coords {
              latitude
              longitude
            }
            ietCategory
            ietValue
            locationType
            createdAt
            updatedAt
          }
        }
      }
    GRAPHQL
  end

  before do
    post_request
  end

  describe 'POST' do
    context 'when params are valid' do
      before do
        create_list(:measure, limit, coords: Geo.point(longitude + 0.5, latitude + 0.5))

        post_request
      end

      it 'returns a json with a list of 3 measures' do
        expect(query_reponse[:measures].size).to eq 3
      end

      it 'returns a json with a totalCount of 5' do
        expect(query_reponse[:totalCount]).to eq 5
      end
    end

    context 'when params does not match any record' do
      it 'returns a json with an empty list of measures' do
        expect(query_reponse[:measures].size).to be_zero
      end

      it 'returns a json with a totalCount of 0' do
        expect(query_reponse[:totalCount]).to be_zero
      end
    end

    context 'when user is not authorized' do
      include_examples 'without jwt authentication', 'fetchMeasuresWithinBox'
    end
  end

  describe 'arguments' do
    subject { described_class }

    it { is_expected.to accept_argument(:sw_coords).of_type('CoordinatesInput!') }
    it { is_expected.to accept_argument(:ne_coords).of_type('CoordinatesInput!') }
    it { is_expected.to accept_argument(:initial_date).of_type('ISO8601DateTime') }
    it { is_expected.to accept_argument(:final_date).of_type('ISO8601DateTime') }
    it { is_expected.to accept_argument(:limit).of_type('Int') }
  end

  describe 'documentation' do
    it 'returns general description' do
      expect(described_class.description).to eq(
        I18n.t('graphql.queries.fetch_measures_within_box.description')
      )
    end

    it 'returns sw_coords description' do
      expect(described_class.arguments['swCoords'].description).to eq(
        I18n.t('graphql.queries.fetch_measures_within_box.arguments.sw_coords')
      )
    end

    it 'returns ne_coords description' do
      expect(described_class.arguments['neCoords'].description).to eq(
        I18n.t('graphql.queries.fetch_measures_within_box.arguments.ne_coords')
      )
    end

    it 'returns initial_date description' do
      expect(described_class.arguments['initialDate'].description).to eq(
        I18n.t('graphql.queries.fetch_measures_within_box.arguments.initial_date')
      )
    end

    it 'returns final_date description' do
      expect(described_class.arguments['finalDate'].description).to eq(
        I18n.t('graphql.queries.fetch_measures_within_box.arguments.final_date')
      )
    end

    it 'returns limit description' do
      expect(described_class.arguments['limit'].description).to eq(
        I18n.t('graphql.queries.fetch_measures_within_box.arguments.limit')
      )
    end
  end
end
