# frozen_string_literal: true

module Mutations
  class SignUp < Mutations::BaseMutation
    description I18n.t('graphql.mutations.sign_up.description')

    argument :email, String, required: true,
      description: I18n.t('graphql.mutations.sign_up.arguments.email')

    argument :password, String, required: true,
      description: I18n.t('graphql.mutations.sign_up.arguments.password')

    argument :password_confirmation, String, required: true,
      description: I18n.t('graphql.mutations.sign_up.arguments.password_confirmation')

    type Types::Domain::UserType

    def resolve(**args)
      context = CreateUser.call(args)

      graphql_error!(context)

      context.user
    end
  end
end
