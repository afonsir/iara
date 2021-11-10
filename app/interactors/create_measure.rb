# frozen_string_literal: true

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
    context.measure = Measure.create!(
      coords:        geo_point,
      iet_value:     iet_value,
      iet_category:  iet_category,
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
