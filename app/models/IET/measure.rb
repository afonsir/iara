# frozen_string_literal: true

module IET
  class Measure < ApplicationRecord
    validates :coords, :category, :value, presence: true
    validates :value, numericality: true

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
