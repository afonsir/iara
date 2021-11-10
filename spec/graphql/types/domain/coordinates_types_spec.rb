# frozen_string_literal: true

require 'rails_helper'

describe Types::Domain::CoordinatesType do
  subject { described_class }

  it { is_expected.to have_field(:latitude).of_type('Float!') }
  it { is_expected.to have_field(:longitude).of_type('Float!') }

  describe 'documentation' do
    it 'returns general description' do
      expect(described_class.description).to eq(
        I18n.t('graphql.types.domain.coordinates_types.description')
      )
    end

    it 'returns latitude description' do
      expect(described_class.fields['latitude'].description).to eq(
        I18n.t('graphql.types.domain.coordinates_types.fields.latitude')
      )
    end

    it 'returns longitude description' do
      expect(described_class.fields['longitude'].description).to eq(
        I18n.t('graphql.types.domain.coordinates_types.fields.longitude')
      )
    end
  end
end
