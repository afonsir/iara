# frozen_string_literal: true

module Validators
  class DistanceInput
    include Interactor

    # input interface
    delegate :distance_in_km, to: :context

    def call
      return if distance_in_km.blank? || distance_in_km.positive?

      context.fail!(error: validation_message)
    end

    private

    def validation_message
      I18n.t(
        'errors.format',
        attribute: I18n.t('activerecord.attributes.measure.distance_in_km'),
        message:   I18n.t('errors.messages.greater_than', count: 0)
      )
    end
  end
end
