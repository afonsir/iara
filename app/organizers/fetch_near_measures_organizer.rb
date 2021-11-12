# frozen_string_literal: true

class FetchNearMeasuresOrganizer
  include Interactor::Organizer

  organize Validators::Coordinates,
    Validators::DistanceInput,
    Fetch::NearMeasures
end
