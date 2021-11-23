# frozen_string_literal: true

module Mutations
  class SignIn < Mutations::BaseMutation
    description I18n.t('graphql.mutations.sign_in.description')

    argument :email, String, required: true,
      description: I18n.t('graphql.mutations.sign_in.arguments.email')

    argument :password, String, required: true,
      description: I18n.t('graphql.mutations.sign_in.arguments.password')

    field :token, String, null: false,
      description: I18n.t('graphql.mutations.sign_in.arguments.token')

    def resolve(**args)
      context = GenerateToken.call(args)

      graphql_error!(context)

      context
    end
  end
end
