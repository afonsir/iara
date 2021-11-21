# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :calculate_iet, mutation: Mutations::CalculateIet

    with_options guard: GraphqlPolicy::LOGGED do
      field :create_iet_measure, mutation: Mutations::CreateIetMeasure
    end
  end
end
