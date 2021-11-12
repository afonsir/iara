# frozen_string_literal: true

module Types
  module Domain
    module Inputs
      class CoordinatesInputType < Types::BaseInputObject
        description I18n.t('graphql.types.domain.coordinates_types.description')

        argument :latitude, Float, required: true,
          description: I18n.t('graphql.types.domain.coordinates_types.fields.latitude')

        argument :longitude, Float, required: true,
          description: I18n.t('graphql.types.domain.coordinates_types.fields.longitude')
      end
    end
  end
end
