# frozen_string_literal: true

module Types
  module Domain
    class MeasureType < Types::BaseObject
      description I18n.t('graphql.types.domain.measure_type.description')

      field :id, Int, null: false,
        description: I18n.t('graphql.types.domain.measure_type.fields.id')

      field :coords, CoordinatesType, null: false,
        description: I18n.t('graphql.types.domain.measure_type.fields.coords')

      field :iet_category, Enums::CategoryType, null: false,
        description: I18n.t('graphql.types.domain.measure_type.fields.iet_category')

      field :iet_value, Float, null: false,
        description: I18n.t('graphql.types.domain.measure_type.fields.iet_value')

      field :location_type, Enums::LocationType, null: false,
        description: I18n.t('graphql.types.domain.measure_type.fields.location_type')

      field :created_at, GraphQL::Types::ISO8601DateTime, null: false,
        description: I18n.t('graphql.types.domain.measure_type.fields.created_at')

      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false,
        description: I18n.t('graphql.types.domain.measure_type.fields.updated_at')
    end
  end
end
