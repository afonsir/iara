# frozen_string_literal: true

module Validators
  class Coordinates
    include Interactor

    # input interface
    delegate :latitude, :longitude, to: :context

    def call
      return if latitude.present? && longitude.present?

      context.fail!(error: validation_message)
    end

    private

    def validation_message
      I18n.t(
        'errors.format',
        attribute: I18n.t('activerecord.attributes.measure.coords'),
        message:   I18n.t('errors.messages.blank')
      )
    end
  end
end
