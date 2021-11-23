# frozen_string_literal: true

require 'rails_helper'

describe Mutations::SignIn, type: :request do
  subject(:mutation_response) { json_response[:data][:signIn] }

  let(:email)    { Faker::Internet.email }
  let(:password) { Faker::Internet.password }

  let(:query) do
    <<-GRAPHQL
      mutation {
        signIn(
          input: {
            email:    "#{email}"
            password: "#{password}"
          }
        ) {
          token
        }
      }
    GRAPHQL
  end

  before do
    post_request
  end

  describe 'POST' do
    context 'when params are valid' do
      before do
        create(:user, email: email, password: password)

        post_request
      end

      it 'returns a json with generated token' do
        expect(mutation_response[:token]).not_to be_nil
      end
    end

    context 'when params are invalid' do
      let(:password) { 'any_password' }

      let(:error_message) do
        I18n.t('errors.custom.invalid_authentication')
      end

      it 'returns errors inside the json' do
        expect(json_response[:errors]).to contain_exactly(hash_including(
          message: error_message, path: ['signIn']
        ))
      end
    end
  end

  describe 'arguments' do
    subject { described_class }

    it { is_expected.to accept_argument(:email).of_type('String!') }
    it { is_expected.to accept_argument(:password).of_type('String!') }
  end

  describe 'documentation' do
    it 'returns general description' do
      expect(described_class.description).to eq(
        I18n.t('graphql.mutations.sign_in.description')
      )
    end

    it 'returns email description' do
      expect(described_class.arguments['email'].description).to eq(
        I18n.t('graphql.mutations.sign_in.arguments.email')
      )
    end

    it 'returns password description' do
      expect(described_class.arguments['password'].description).to eq(
        I18n.t('graphql.mutations.sign_in.arguments.password')
      )
    end
  end
end
