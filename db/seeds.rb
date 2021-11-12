# frozen_string_literal: true

puts 'Importing seeds...'

10_000.times do
  print '*'
  Measure.upsert_all(FactoryBot.attributes_for_list(:measure, 10, :coords_in_wkt))
end

puts
