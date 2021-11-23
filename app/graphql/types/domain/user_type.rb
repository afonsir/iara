# frozen_string_literal: true

module Types
  module Domain
    class UserType < Types::BaseObject
      description I18n.t('graphql.types.domain.user_type.description')

      field :id, Int, null: false,
        description: I18n.t('graphql.types.domain.user_type.fields.id')

      field :email, String, null: false,
        description: I18n.t('graphql.types.domain.user_type.fields.email')

      field :created_at, GraphQL::Types::ISO8601DateTime, null: false,
        description: I18n.t('graphql.types.domain.user_type.fields.created_at')

      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false,
        description: I18n.t('graphql.types.domain.user_type.fields.updated_at')
    end
  end
end
