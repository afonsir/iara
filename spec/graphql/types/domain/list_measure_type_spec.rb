# frozen_string_literal: true

require 'rails_helper'

describe Types::Domain::ListMeasureType do
  subject { described_class }

  it { is_expected.to have_field(:total_count).of_type('Int!') }
  it { is_expected.to have_field(:measures).of_type('[Measure!]!') }

  describe 'documentation' do
    it 'returns general description' do
      expect(described_class.description).to eq(
        I18n.t('graphql.types.domain.list_measure_type.description')
      )
    end

    it 'returns total_count description' do
      expect(described_class.fields['totalCount'].description).to eq(
        I18n.t('graphql.types.domain.list_measure_type.fields.total_count')
      )
    end

    it 'returns measures description' do
      expect(described_class.fields['measures'].description).to eq(
        I18n.t('graphql.types.domain.list_measure_type.fields.measures')
      )
    end
  end
end
