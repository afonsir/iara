# frozen_string_literal: true

module Mutations
  class CreateIetMeasure < Mutations::BaseMutation
    description I18n.t('graphql.mutations.create_iet_measure.description')

    argument :coords, Types::Domain::Inputs::CoordinatesInputType, required: true,
      description: I18n.t('graphql.mutations.create_iet_measure.arguments.coords')

    argument :cl_in_micrograms, Float, required: true,
      description: I18n.t('graphql.mutations.create_iet_measure.arguments.cl_in_micrograms')

    argument :pt_in_micrograms, Float, required: true,
      description: I18n.t('graphql.mutations.create_iet_measure.arguments.pt_in_micrograms')

    argument :location_type, Types::Domain::Enums::LocationType, required: true,
      description: I18n.t('graphql.mutations.calculate_iet.arguments.location_type')

    type Types::Domain::MeasureType

    def resolve(coords:, **args)
      context = CreateMeasureOrganizer.call(args.merge(coords.to_h))

      graphql_error!(context)

      context.measure
    end
  end
end
