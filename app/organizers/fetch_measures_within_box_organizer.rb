# frozen_string_literal: true

class FetchMeasuresWithinBoxOrganizer
  include Interactor::Organizer

  organize Validators::BoxCoordinates,
    Fetch::MeasuresWithinBox,
    Fetch::Limit
end
