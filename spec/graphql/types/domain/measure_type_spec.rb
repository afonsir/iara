# frozen_string_literal: true

require 'rails_helper'

describe Types::Domain::MeasureType do
  subject { described_class }

  it { is_expected.to have_field(:id).of_type('Int!') }
  it { is_expected.to have_field(:iet_category).of_type('Category!') }
  it { is_expected.to have_field(:iet_value).of_type('Float!') }
  it { is_expected.to have_field(:location_type).of_type('Location!') }
  it { is_expected.to have_field(:created_at).of_type('ISO8601DateTime!') }
  it { is_expected.to have_field(:updated_at).of_type('ISO8601DateTime!') }

  describe 'documentation' do
    it 'returns general description' do
      expect(described_class.description).to eq(
        I18n.t('graphql.types.domain.measure_type.description')
      )
    end

    it 'returns ID description' do
      expect(described_class.fields['id'].description).to eq(
        I18n.t('graphql.types.domain.measure_type.fields.id')
      )
    end

    it 'returns iet_category description' do
      expect(described_class.fields['ietCategory'].description).to eq(
        I18n.t('graphql.types.domain.measure_type.fields.iet_category')
      )
    end

    it 'returns iet_value description' do
      expect(described_class.fields['ietValue'].description).to eq(
        I18n.t('graphql.types.domain.measure_type.fields.iet_value')
      )
    end

    it 'returns location_type description' do
      expect(described_class.fields['locationType'].description).to eq(
        I18n.t('graphql.types.domain.measure_type.fields.location_type')
      )
    end

    it 'returns created_at description' do
      expect(described_class.fields['createdAt'].description).to eq(
        I18n.t('graphql.types.domain.measure_type.fields.created_at')
      )
    end

    it 'returns updated_at description' do
      expect(described_class.fields['updatedAt'].description).to eq(
        I18n.t('graphql.types.domain.measure_type.fields.updated_at')
      )
    end
  end
end
