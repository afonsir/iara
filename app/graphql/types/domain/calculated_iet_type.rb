# frozen_string_literal: true

module Types
  module Domain
    class CalculatedIetType < Types::BaseObject
      description I18n.t('graphql.types.domain.calculated_iet_type.description')

      field :iet_category, Enums::CategoryType, null: false,
        description: I18n.t('graphql.types.domain.calculated_iet_type.fields.iet_category')

      field :iet_value, Float, null: false,
        description: I18n.t('graphql.types.domain.calculated_iet_type.fields.iet_value')
    end
  end
end
