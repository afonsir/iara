# frozen_string_literal: true

module Types
  module Domain
    module Enums
      class CategoryType < BaseEnum
        description I18n.t('graphql.types.domain.category_type.description')

        value :eutrofico,
          description: I18n.t('graphql.types.domain.category_type.values.eutrofico')

        value :hipereutrofico,
          description: I18n.t('graphql.types.domain.category_type.values.hipereutrofico')

        value :mesotrofico,
          description: I18n.t('graphql.types.domain.category_type.values.mesotrofico')

        value :oligotrofico,
          description: I18n.t('graphql.types.domain.category_type.values.oligotrofico')

        value :supereutrofico,
          description: I18n.t('graphql.types.domain.category_type.values.supereutrofico')

        value :ultraoligotrofico,
          description: I18n.t('graphql.types.domain.category_type.values.ultraoligotrofico')
      end
    end
  end
end
