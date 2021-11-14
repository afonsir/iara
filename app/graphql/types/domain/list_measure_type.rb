# frozen_string_literal: true

module Types
  module Domain
    class ListMeasureType < Types::BaseObject
      description I18n.t('graphql.types.domain.list_measure_type.description')

      field :total_count, Int, null: false,
        description: I18n.t('graphql.types.domain.list_measure_type.fields.total_count')

      field :measures, [Types::Domain::MeasureType], null: false,
        description: I18n.t('graphql.types.domain.list_measure_type.fields.measures')
    end
  end
end
