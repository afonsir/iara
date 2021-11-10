# frozen_string_literal: true

class CreateMeasureOrganizer
  include Interactor::Organizer

  organize ValidateCoordinates,
    CalculateOrganizer,
    CreateMeasure
end
