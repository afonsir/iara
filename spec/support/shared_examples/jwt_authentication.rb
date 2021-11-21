# frozen_string_literal: true

RSpec.shared_context 'with jwt authentication' do
  let(:token_payload) { { 'id' => create(:user).id } }

  before do
    allow(JsonWebToken).to receive(:decode).and_return(token_payload)
  end
end

RSpec.shared_examples 'without jwt authentication' do |graphql_path|
  let(:token_payload) { nil }

  let(:error_message) { I18n.t('errors.custom.without_permission') }

  it 'returns errors inside the json' do
    expect(json_response[:errors]).to contain_exactly(hash_including(
      message: error_message, path: [graphql_path]
    ))
  end
end

RSpec.configure do |config|
  config.include_context 'with jwt authentication', authenticate: true
end
