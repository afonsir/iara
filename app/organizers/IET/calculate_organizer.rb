# frozen_string_literal: true

module IET
  class CalculateOrganizer
    include Interactor::Organizer

    organize ValidateLocationType,
      Calculate,
      DefineCategory
  end
end
