# frozen_string_literal: true

module IET
  class CreateMeasure
    include Interactor

    # input interface
    delegate :iet_category,
      :iet_value,
      :latitude,
      :longitude,
      :location_type,
      to: :context

    def call
      context.measure = IET::Measure.create!(
        coords:        geo_point,
        value:         iet_value,
        category:      iet_category,
        location_type: location_type
      )
    rescue => e
      context.fail!(error: validation_message(e.record))
    end

    private

    def geo_point
      Geo.point(longitude, latitude)
    end

    def validation_message(record)
      I18n.t(
        'errors.messages.model_invalid',
        errors: record.errors.full_messages.uniq.join(', ')
      )
    end
  end
end
