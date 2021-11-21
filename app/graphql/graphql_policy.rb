# frozen_string_literal: true

class GraphqlPolicy
  # AUTHENTICATION
  LOGGED = ->(_obj, _args, ctx) { ctx[:current_user] }
end
