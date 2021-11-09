# frozen_string_literal: true

module IET
  class CreateMeasureOrganizer
    include Interactor::Organizer

    organize ValidateCoordinates,
      CalculateOrganizer,
      CreateMeasure
  end
end
