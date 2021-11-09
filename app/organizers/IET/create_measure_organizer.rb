# frozen_string_literal: true

module IET
  class CreateMeasureOrganizer
    include Interactor::Organizer

    organize CalculateOrganizer,
      CreateMeasure
  end
end
