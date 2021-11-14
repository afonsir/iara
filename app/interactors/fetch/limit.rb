# frozen_string_literal: true

module Fetch
  class Limit
    include Interactor

    # input interface
    delegate :limit, to: :context

    def call
      context.total_count = context.measures.size
      context.measures = context.measures.limit(limit&.abs) if limit.present?
    end
  end
end
