# frozen_string_literal: true

class CreateMeasureOrganizer
  include Interactor::Organizer

  organize Validators::Coordinates,
    CalculateOrganizer,
    CreateMeasure
end
