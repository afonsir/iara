# frozen_string_literal: true

module Validators
  class BoxCoordinates
    include Interactor

    # input interface
    delegate :ne_latitude,
      :ne_longitude,
      :sw_latitude,
      :sw_longitude,
      to: :context

    def call
      return if all_coords_valid?

      context.fail!(error: validation_message)
    end

    private

    def all_coords_valid?
      valid_latitudes? && valid_longitudes?
    end

    def valid_latitudes?
      ne_latitude.present? && ne_latitude.abs <= 90 &&
        sw_latitude.present? && sw_latitude.abs <= 90
    end

    def valid_longitudes?
      ne_longitude.present? && ne_longitude.abs <= 180 &&
        sw_longitude.present? && sw_longitude.abs <= 180
    end

    def validation_message
      I18n.t('errors.custom.invalid_coordinates')
    end
  end
end
