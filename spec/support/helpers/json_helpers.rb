# frozen_string_literal: true

module Support
  module Helpers
    module JsonHelpers
      def json_response
        parsed_response = JSON.parse(response.body)

        if parsed_response.instance_of?(Array)
          parsed_response.map(&:deep_symbolize_keys)
        else
          parsed_response.deep_symbolize_keys
        end
      end
    end
  end
end

RSpec.configure do |config|
  config.include Support::Helpers::JsonHelpers, type: :request
end
