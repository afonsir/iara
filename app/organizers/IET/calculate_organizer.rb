# frozen_string_literal: true

module IET
  class CalculateOrganizer
    include Interactor::Organizer

    organize ValidateType,
      Calculate,
      DefineCategory
  end
end
