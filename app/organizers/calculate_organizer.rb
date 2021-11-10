# frozen_string_literal: true

class CalculateOrganizer
  include Interactor::Organizer

  organize ValidateLocationType,
    Calculate,
    DefineCategory
end
