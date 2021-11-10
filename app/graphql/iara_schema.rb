# frozen_string_literal: true

class IaraSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)
end
