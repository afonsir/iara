# frozen_string_literal: true

module IET
  class Measure < ApplicationRecord
    validates :coords, :category, :type, :value, presence: true
    validates :value, numericality: { greater_than_or_equal_to: 0 }

    enum type: { reservatorios: 0, rios: 1 }

    enum category: {
      ultraoligotrofico: 0,
      oligotrofico:      1,
      mesotrofico:       2,
      eutrofico:         3,
      supereutrofico:    4,
      hipereutrofico:    5
    }
  end
end
