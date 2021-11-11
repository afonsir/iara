# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :calculate_iet, mutation: Mutations::CalculateIet
  end
end
