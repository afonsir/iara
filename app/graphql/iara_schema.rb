# frozen_string_literal: true

class IaraSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)

  use GraphQL::Guard.new(
    not_authorized: lambda { |_type, _field|
      GraphQL::ExecutionError.new(I18n.t('errors.custom.without_permission'))
    }
  )
end
