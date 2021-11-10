# frozen_string_literal: true

module Types
  module Domain
    module Enums
      class LocationType < BaseEnum
        description I18n.t('graphql.types.domain.location_type.description')

        value :reservatorios,
          description: I18n.t('graphql.types.domain.location_type.values.reservatorios')

        value :rios,
          description: I18n.t('graphql.types.domain.location_type.values.rios')
      end
    end
  end
end
