# frozen_string_literal: true

module Validators
  class Coordinates
    include Interactor

    # input interface
    delegate :latitude, :longitude, to: :context

    def call
      return if valid_latitude? && valid_longitude?

      context.fail!(error: validation_message)
    end

    private

    def valid_latitude?
      latitude.present? && latitude.abs <= 90
    end

    def valid_longitude?
      longitude.present? && longitude.abs <= 180
    end

    def validation_message
      I18n.t('errors.custom.invalid_coordinates')
    end
  end
end
