# frozen_string_literal: true

module Fetch
  class MeasuresWithinBox
    include Interactor

    # input interface
    delegate :ne_latitude,
      :ne_longitude,
      :sw_latitude,
      :sw_longitude,
      :initial_date,
      :final_date,
      to: :context

    def call
      context.measures = Measure.within_box(sw_geo_point, ne_geo_point)
                                .where(created_at: initial_utc_date..final_utc_date)
                                .order(created_at: :desc)
    end

    private

    def ne_geo_point
      Geo.point(ne_longitude, ne_latitude)
    end

    def sw_geo_point
      Geo.point(sw_longitude, sw_latitude)
    end

    def initial_utc_date
      (initial_date&.to_date || Time.zone.today).beginning_of_day.to_s(:db)
    end

    def final_utc_date
      (final_date&.to_date || Time.zone.today).end_of_day.to_s(:db)
    end
  end
end
