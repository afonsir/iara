# frozen_string_literal: true

module Types
  module Helpers
    # def current_user
    #   context[:current_user]
    # end

    # def current_user_id
    #   current_user&.id
    # end

    def graphql_error!(context)
      raise GraphQL::ExecutionError, context.error if context.failure?
    end
  end
end
