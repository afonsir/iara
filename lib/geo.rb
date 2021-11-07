# frozen_string_literal: true

class Geo
  SRID = 4326 # used by GPS systems

  class << self
    def factory
      @factory ||= RGeo::Geographic.spherical_factory(srid: SRID)
    end

    def point(longitude, latitude)
      factory.point(longitude, latitude)
    end

    def to_wkt(feature)
      "srid=#{SRID};#{feature}"
    end
  end
end
