# frozen_string_literal: true

class CalculateOrganizer
  include Interactor::Organizer

  organize ValidateLocationType,
    Validators::CalculateInput,
    Calculate,
    DefineCategory
end
