# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :calculate_iet, mutation: Mutations::CalculateIet
    field :create_iet_measure, mutation: Mutations::CreateIetMeasure
  end
end
