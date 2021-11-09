# frozen_string_literal: true

module IET
  class ValidateType
    include Interactor

    delegate :type, to: :context

    def call
      return if IET::Measure.types.keys.include? type.gsub(/\W+/, '').downcase

      context.fail!(error: validation_message)
    end

    private

    def validation_message
      I18n.t(
        'errors.format',
        attribute: I18n.t('activerecord.attributes.iet/measure.type'),
        message:   I18n.t('errors.messages.invalid')
      )
    end
  end
end
