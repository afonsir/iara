# frozen_string_literal: true

module IET
  class DefineCategory
    include Interactor

    # input interface
    delegate :iet_value, to: :context

    def call
      context.iet_category = define_category
    end

    private

    def define_category
      return :hipereutrofico if iet_value > 67
      return :supereutrofico if iet_value > 63
      return :eutrofico if iet_value > 59
      return :mesotrofico if iet_value > 52
      return :oligotrofico if iet_value > 47

      :ultraoligotrofico
    end
  end
end
