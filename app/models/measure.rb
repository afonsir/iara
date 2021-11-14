# frozen_string_literal: true

class Measure < ApplicationRecord
  validates :coords, :iet_category, :location_type, :iet_value, presence: true
  validates :iet_value, numericality: { greater_than_or_equal_to: 0 }

  enum location_type: { reservatorios: 0, rios: 1 }

  enum iet_category: {
    ultraoligotrofico: 0,
    oligotrofico:      1,
    mesotrofico:       2,
    eutrofico:         3,
    supereutrofico:    4,
    hipereutrofico:    5
  }

  scope :near, ->(point, distance_in_km = 1) {
    where(
      'ST_DWithin(coords, :point, :distance)',
      { point: Geo.to_wkt(point), distance: distance_in_km * 1_000 }
    )
  }

  scope :within_box, ->(sw_point, ne_point) {
    where(
      "coords && ST_MakeEnvelope(:sw_lon, :sw_lat, :ne_lon, :ne_lat, #{
        Geo::SRID
      })",
      {
        sw_lon: sw_point.longitude,
        sw_lat: sw_point.latitude,
        ne_lon: ne_point.longitude,
        ne_lat: ne_point.latitude
      }
    )
  }
end
