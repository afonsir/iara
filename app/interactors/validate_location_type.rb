# frozen_string_literal: true

class ValidateLocationType
  include Interactor

  # input interface
  delegate :location_type, to: :context

  def call
    return if Measure.location_types.keys.include? location_type.gsub(/\W+/, '').downcase

    context.fail!(error: validation_message)
  end

  private

  def validation_message
    I18n.t(
      'errors.format',
      attribute: I18n.t('activerecord.attributes.measure.location_type'),
      message:   I18n.t('errors.messages.invalid')
    )
  end
end
