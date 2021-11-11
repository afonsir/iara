# frozen_string_literal: true

require 'rails_helper'

describe Types::Domain::CalculatedIetType do
  subject { described_class }

  it { is_expected.to have_field(:iet_category).of_type('Category!') }
  it { is_expected.to have_field(:iet_value).of_type('Float!') }

  describe 'documentation' do
    it 'returns general description' do
      expect(described_class.description).to eq(
        I18n.t('graphql.types.domain.calculated_iet_type.description')
      )
    end

    it 'returns iet_category description' do
      expect(described_class.fields['ietCategory'].description).to eq(
        I18n.t('graphql.types.domain.calculated_iet_type.fields.iet_category')
      )
    end

    it 'returns iet_value description' do
      expect(described_class.fields['ietValue'].description).to eq(
        I18n.t('graphql.types.domain.calculated_iet_type.fields.iet_value')
      )
    end
  end
end
