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
      return if all_coords_present?

      context.fail!(error: validation_message)
    end

    private

    def all_coords_present?
      ne_latitude.present? && ne_longitude.present? &&
        sw_latitude.present? && sw_longitude.present?
    end

    def validation_message
      I18n.t('errors.custom.invalid_coordinates')
    end
  end
end
