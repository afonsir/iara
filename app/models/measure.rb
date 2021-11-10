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
end
