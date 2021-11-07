# frozen_string_literal: true

FactoryBot.define do
  factory :geo_point, class: OpenStruct do
    transient do
      latitude  { Faker::Address.latitude }
      longitude { Faker::Address.longitude }
    end

    initialize_with do
      RGeo::Geographic.spherical_factory(srid: Geo::SRID).point(longitude, latitude)
    end
  end
end
