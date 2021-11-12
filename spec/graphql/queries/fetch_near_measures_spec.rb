# frozen_string_literal: true

require 'rails_helper'

describe Queries::FetchNearMeasures, type: :request do
  subject(:query_reponse) { json_response[:data][:fetchNearMeasures] }

  let(:latitude)  { Faker::Address.latitude }
  let(:longitude) { Faker::Address.longitude }

  let(:limit) { 5 }

  let(:query) do
    <<-GRAPHQL
      query {
        fetchNearMeasures(
          coords: {
            latitude:  #{latitude}
            longitude: #{longitude}
          }
          limit: 3
        ) {
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
    GRAPHQL
  end

  before do
    post_request
  end

  describe 'POST' do
    context 'when params are valid' do
      before do
        create_list(:measure, limit, coords: Geo.point(longitude, latitude))

        post_request
      end

      it 'returns a json with a list of 3 measures' do
        expect(query_reponse.size).to eq(3)
      end
    end

    context 'when params does not match any record' do
      it 'returns a json with an empty list of measures' do
        expect(query_reponse.size).to be_zero
      end
    end
  end

  describe 'arguments' do
    subject { described_class }

    it { is_expected.to accept_argument(:coords).of_type('CoordinatesInput!') }
    it { is_expected.to accept_argument(:distance_in_km).of_type('Float') }
    it { is_expected.to accept_argument(:initial_date).of_type('ISO8601DateTime') }
    it { is_expected.to accept_argument(:final_date).of_type('ISO8601DateTime') }
    it { is_expected.to accept_argument(:limit).of_type('Int') }
  end

  describe 'documentation' do
    it 'returns general description' do
      expect(described_class.description).to eq(
        I18n.t('graphql.queries.fetch_near_measures.description')
      )
    end

    it 'returns coords description' do
      expect(described_class.arguments['coords'].description).to eq(
        I18n.t('graphql.queries.fetch_near_measures.arguments.coords')
      )
    end

    it 'returns distance_in_km description' do
      expect(described_class.arguments['distanceInKm'].description).to eq(
        I18n.t('graphql.queries.fetch_near_measures.arguments.distance_in_km')
      )
    end

    it 'returns initial_date description' do
      expect(described_class.arguments['initialDate'].description).to eq(
        I18n.t('graphql.queries.fetch_near_measures.arguments.initial_date')
      )
    end

    it 'returns final_date description' do
      expect(described_class.arguments['finalDate'].description).to eq(
        I18n.t('graphql.queries.fetch_near_measures.arguments.final_date')
      )
    end

    it 'returns limit description' do
      expect(described_class.arguments['limit'].description).to eq(
        I18n.t('graphql.queries.fetch_near_measures.arguments.limit')
      )
    end
  end
end
