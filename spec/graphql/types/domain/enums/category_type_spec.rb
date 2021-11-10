# frozen_string_literal: true

require 'rails_helper'

describe Types::Domain::Enums::CategoryType do
  subject { described_class }

  let(:enum_keys) { Measure.iet_categories.keys }

  it { expect(described_class.values.keys).to match_array(enum_keys) }

  describe 'documentation' do
    it 'returns general description' do
      expect(described_class.description).to eq(
        I18n.t('graphql.types.domain.category_type.description')
      )
    end

    it 'returns eutrofico description' do
      expect(described_class.values['eutrofico'].description).to eq(
        I18n.t('graphql.types.domain.category_type.values.eutrofico')
      )
    end

    it 'returns hipereutrofico description' do
      expect(described_class.values['hipereutrofico'].description).to eq(
        I18n.t('graphql.types.domain.category_type.values.hipereutrofico')
      )
    end

    it 'returns mesotrofico description' do
      expect(described_class.values['mesotrofico'].description).to eq(
        I18n.t('graphql.types.domain.category_type.values.mesotrofico')
      )
    end

    it 'returns oligotrofico description' do
      expect(described_class.values['oligotrofico'].description).to eq(
        I18n.t('graphql.types.domain.category_type.values.oligotrofico')
      )
    end

    it 'returns supereutrofico description' do
      expect(described_class.values['supereutrofico'].description).to eq(
        I18n.t('graphql.types.domain.category_type.values.supereutrofico')
      )
    end

    it 'returns ultraoligotrofico description' do
      expect(described_class.values['ultraoligotrofico'].description).to eq(
        I18n.t('graphql.types.domain.category_type.values.ultraoligotrofico')
      )
    end
  end
end
