# frozen_string_literal: true

RSpec.shared_context 'with graphql query request' do
  let(:headers)   { {} }
  let(:variables) { {} }

  let(:graphql_params) do
    {
      params:  { query: query, variables: variables },
      headers: headers
    }
  end

  def post_request(path: '/graphql')
    post(path, **graphql_params)
  end
end

RSpec.configure do |config|
  config.include_context 'with graphql query request', type: :request
end
