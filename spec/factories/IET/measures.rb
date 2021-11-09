# frozen_string_literal: true

FactoryBot.define do
  factory :measure, class: 'IET::Measure' do
    category { IET::Measure.categories.keys.sample }
    coords   { build(:geo_point) }
    type     { IET::Measure.types.keys.sample }
    value    { Faker::Number.decimal(l_digits: 2) }
  end
end
