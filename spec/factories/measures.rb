# frozen_string_literal: true

FactoryBot.define do
  factory :measure, class: 'Measure' do
    coords        { build(:geo_point) }
    iet_category  { Measure.iet_categories.keys.sample }
    iet_value     { Faker::Number.decimal(l_digits: 2, r_digits: 5) }
    location_type { Measure.location_types.keys.sample }
    created_at    { Time.zone.now }
    updated_at    { Time.zone.now }

    trait :coords_in_wkt do
      coords { Geo.to_wkt(build(:geo_point)) }
    end
  end
end
