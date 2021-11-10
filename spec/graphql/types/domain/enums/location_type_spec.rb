# frozen_string_literal: true

require 'rails_helper'

describe Types::Domain::Enums::LocationType do
  subject { described_class }

  let(:enum_keys) { Measure.location_types.keys }

  it { expect(described_class.values.keys).to match_array(enum_keys) }

  describe 'documentation' do
    it 'returns general description' do
      expect(described_class.description).to eq(
        I18n.t('graphql.types.domain.location_type.description')
      )
    end

    it 'returns reservatorios description' do
      expect(described_class.values['reservatorios'].description).to eq(
        I18n.t('graphql.types.domain.location_type.values.reservatorios')
      )
    end

    it 'returns rios description' do
      expect(described_class.values['rios'].description).to eq(
        I18n.t('graphql.types.domain.location_type.values.rios')
      )
    end
  end
end
