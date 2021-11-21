# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    with_options guard: GraphqlPolicy::LOGGED do
      field :fetch_near_measures, resolver: Queries::FetchNearMeasures
      field :fetch_measures_within_box, resolver: Queries::FetchMeasuresWithinBox
    end
  end
end
