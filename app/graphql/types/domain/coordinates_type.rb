# frozen_string_literal: true

module Types
  module Domain
    class CoordinatesType < Types::BaseObject
      description I18n.t('graphql.types.domain.coordinates_types.description')

      field :latitude, Float, null: false,
        description: I18n.t('graphql.types.domain.coordinates_types.fields.latitude')

      field :longitude, Float, null: false,
        description: I18n.t('graphql.types.domain.coordinates_types.fields.longitude')
    end
  end
end
