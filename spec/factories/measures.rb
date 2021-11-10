# frozen_string_literal: true

FactoryBot.define do
  factory :measure, class: 'Measure' do
    coords        { build(:geo_point) }
    iet_category  { Measure.iet_categories.keys.sample }
    iet_value     { Faker::Number.decimal(l_digits: 2) }
    location_type { Measure.location_types.keys.sample }
  end
end
