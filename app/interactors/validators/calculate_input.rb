# frozen_string_literal: true

module Validators
  class CalculateInput
    include Interactor

    # input interface
    delegate :cl_in_micrograms, :pt_in_micrograms, to: :context

    def call
      return if cl_in_micrograms.positive? && pt_in_micrograms.positive?

      context.fail!(error: validation_message)
    end

    private

    def validation_message
      I18n.t(
        'errors.format',
        attribute: "#{cl_in_micrograms_t} e #{pt_in_micrograms_t}",
        message:   I18n.t('errors.messages.greater_than', count: 0)
      )
    end

    def cl_in_micrograms_t
      I18n.t('graphql.mutations.calculate_iet.arguments.cl_in_micrograms')
    end

    def pt_in_micrograms_t
      I18n.t('graphql.mutations.calculate_iet.arguments.pt_in_micrograms')
    end
  end
end
