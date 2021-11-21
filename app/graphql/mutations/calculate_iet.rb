# frozen_string_literal: true

module Mutations
  class CalculateIet < Mutations::BaseMutation
    description I18n.t('graphql.mutations.calculate_iet.description')

    argument :cl_in_micrograms, Float, required: true,
      description: I18n.t('graphql.mutations.calculate_iet.arguments.cl_in_micrograms')

    argument :pt_in_micrograms, Float, required: true,
      description: I18n.t('graphql.mutations.calculate_iet.arguments.pt_in_micrograms')

    argument :location_type, Types::Domain::Enums::LocationType, required: true,
      description: I18n.t('graphql.mutations.calculate_iet.arguments.location_type')

    type Types::Domain::CalculatedIetType

    def resolve(**args)
      context = CalculateOrganizer.call(args)

      graphql_error!(context)

      result(context)
    end

    private

    def result(context)
      {
        iet_category: context[:iet_category].to_s,
        iet_value:    context[:iet_value]
      }
    end
  end
end
