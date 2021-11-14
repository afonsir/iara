# frozen_string_literal: true

module Queries
  class FetchNearMeasures < Queries::BaseQuery
    description I18n.t('graphql.queries.fetch_near_measures.description')

    argument :coords, Types::Domain::Inputs::CoordinatesInputType, required: true,
      description: I18n.t('graphql.queries.fetch_near_measures.arguments.coords')

    argument :distance_in_km, Float, required: false,
      description: I18n.t('graphql.queries.fetch_near_measures.arguments.distance_in_km')

    argument :initial_date, GraphQL::Types::ISO8601DateTime, required: false,
      description: I18n.t('graphql.queries.fetch_near_measures.arguments.initial_date')

    argument :final_date, GraphQL::Types::ISO8601DateTime, required: false,
      description: I18n.t('graphql.queries.fetch_near_measures.arguments.final_date')

    argument :limit, Int, required: false,
      description: I18n.t('graphql.queries.fetch_near_measures.arguments.limit')

    type Types::Domain::ListMeasureType, null: false

    def resolve(coords:, **args)
      context = FetchNearMeasuresOrganizer.call(args.merge(coords.to_h))

      raise GraphQL::ExecutionError, context.error if context.failure?

      result(context)
    end

    private

    def result(context)
      {
        total_count: context[:total_count],
        measures:    context[:measures]
      }
    end
  end
end
