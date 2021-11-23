# frozen_string_literal: true

class GenerateToken
  include Interactor

  # input interface
  delegate :email, :password, to: :context

  # internal aliases
  delegate :user, to: :context

  def call
    context.user = find_user!

    context.fail!(error: validation_message) unless valid_password?

    context.token = generate_token
  rescue
    context.fail!(error: validation_message)
  end

  private

  def find_user!
    User.find_by!(email: email)
  end

  def generate_token
    JsonWebToken.encode({ id: user.id })
  end

  def valid_password?
    user.valid_password? password
  end

  def validation_message
    I18n.t('errors.custom.invalid_authentication')
  end
end
