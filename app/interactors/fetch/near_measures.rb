# frozen_string_literal: true

module Fetch
  class NearMeasures
    include Interactor

    # input interface
    delegate :latitude,
      :longitude,
      :distance_in_km,
      :initial_date,
      :final_date,
      :limit,
      to: :context

    def call
      context.measures = Measure.near(geo_point, distance_in_km || 1)
                                .where(created_at: initial_utc_date..final_utc_date)
                                .order(created_at: :desc)
    end

    private

    def geo_point
      Geo.point(longitude, latitude)
    end

    def initial_utc_date
      (initial_date&.to_date || Time.zone.today).beginning_of_day.to_s(:db)
    end

    def final_utc_date
      (final_date&.to_date || Time.zone.today).end_of_day.to_s(:db)
    end
  end
end
