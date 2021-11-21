# frozen_string_literal: true

require 'jwt'

module JsonWebToken
  SECRET = ENV.fetch('SECRET_KEY', Rails.application.credentials.secret_key_base)

  class << self
    def encode(payload, exp: 7.days.to_i)
      payload[:exp] = Time.current.to_i + exp
      JWT.encode(payload, SECRET, 'HS256')
    end

    def decode(token)
      JWT.decode(token, SECRET, true, algorithm: 'HS256').first
    end
  end
end
