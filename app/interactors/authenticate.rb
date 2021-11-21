# frozen_string_literal: true

class Authenticate
  include Interactor

  # input interface
  delegate :headers, to: :context

  def call
    return if authorization_header.blank?

    decoded = JsonWebToken.decode(authorization_header)
    context.user = User.find(decoded['id'])
  rescue
    context.fail!(error: validation_message)
  end

  private

  def authorization_header
    headers['Authorization']
  end

  def validation_message
    I18n.t('errors.custom.invalid_authentication')
  end
end
