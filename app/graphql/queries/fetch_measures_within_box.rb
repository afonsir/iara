# frozen_string_literal: true

module Queries
  class FetchMeasuresWithinBox < Queries::BaseQuery
    description I18n.t('graphql.queries.fetch_measures_within_box.description')

    argument :sw_coords, Types::Domain::Inputs::CoordinatesInputType, required: true,
      description: I18n.t('graphql.queries.fetch_measures_within_box.arguments.sw_coords')

    argument :ne_coords, Types::Domain::Inputs::CoordinatesInputType, required: true,
      description: I18n.t('graphql.queries.fetch_measures_within_box.arguments.ne_coords')

    argument :initial_date, GraphQL::Types::ISO8601DateTime, required: false,
      description: I18n.t('graphql.queries.fetch_measures_within_box.arguments.initial_date')

    argument :final_date, GraphQL::Types::ISO8601DateTime, required: false,
      description: I18n.t('graphql.queries.fetch_measures_within_box.arguments.final_date')

    argument :limit, Int, required: false,
      description: I18n.t('graphql.queries.fetch_measures_within_box.arguments.limit')

    type Types::Domain::ListMeasureType, null: false

    def resolve(sw_coords:, ne_coords:, **args)
      context = FetchMeasuresWithinBoxOrganizer.call(
        organizer_context(sw_coords, ne_coords, args)
      )

      raise GraphQL::ExecutionError, context.error if context.failure?

      result(context)
    end

    private

    def organizer_context(sw_coords, ne_coords, args)
      coords = {
        sw_latitude:  sw_coords[:latitude],
        sw_longitude: sw_coords[:longitude],
        ne_latitude:  ne_coords[:latitude],
        ne_longitude: ne_coords[:longitude]
      }
      args.merge(coords)
    end

    def result(context)
      {
        total_count: context[:total_count],
        measures:    context[:measures]
      }
    end
  end
end
