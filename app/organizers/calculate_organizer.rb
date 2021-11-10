# frozen_string_literal: true

class CalculateOrganizer
  include Interactor::Organizer

  organize Validators::LocationType,
    Validators::CalculateInput,
    Calculate,
    DefineCategory
end
