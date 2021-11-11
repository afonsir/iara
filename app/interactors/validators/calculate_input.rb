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
      I18n.t('errors.custom.invalid_cl_and_pt_in_micrograms', count: 0)
    end
  end
end
