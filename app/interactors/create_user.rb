# frozen_string_literal: true

class CreateUser
  include Interactor

  # input interface
  delegate :email, :password, :password_confirmation, to: :context

  def call
    context.user = User.create!(
      email:                 email,
      password:              password,
      password_confirmation: password_confirmation
    )
  rescue => e
    context.fail!(error: validation_message(e.record))
  end

  private

  def validation_message(record)
    I18n.t(
      'errors.messages.model_invalid',
      errors: record.errors.full_messages.uniq.join(', ')
    )
  end
end
