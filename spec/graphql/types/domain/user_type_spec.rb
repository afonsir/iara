# frozen_string_literal: true

require 'rails_helper'

describe Types::Domain::UserType do
  subject { described_class }

  it { is_expected.to have_field(:id).of_type('Int!') }
  it { is_expected.to have_field(:email).of_type('String!') }
  it { is_expected.to have_field(:created_at).of_type('ISO8601DateTime!') }
  it { is_expected.to have_field(:updated_at).of_type('ISO8601DateTime!') }

  describe 'documentation' do
    it 'returns general description' do
      expect(described_class.description).to eq(
        I18n.t('graphql.types.domain.user_type.description')
      )
    end

    it 'returns ID description' do
      expect(described_class.fields['id'].description).to eq(
        I18n.t('graphql.types.domain.user_type.fields.id')
      )
    end

    it 'returns email description' do
      expect(described_class.fields['email'].description).to eq(
        I18n.t('graphql.types.domain.user_type.fields.email')
      )
    end

    it 'returns created_at description' do
      expect(described_class.fields['createdAt'].description).to eq(
        I18n.t('graphql.types.domain.user_type.fields.created_at')
      )
    end

    it 'returns updated_at description' do
      expect(described_class.fields['updatedAt'].description).to eq(
        I18n.t('graphql.types.domain.user_type.fields.updated_at')
      )
    end
  end
end
