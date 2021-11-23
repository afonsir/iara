# frozen_string_literal: true

require 'rails_helper'

describe Mutations::SignUp, type: :request do
  subject(:mutation_response) { json_response[:data][:signUp] }

  let(:email)                 { Faker::Internet.email }
  let(:password)              { Faker::Internet.password }
  let(:password_confirmation) { password }

  let(:query) do
    <<-GRAPHQL
      mutation {
        signUp(
          input: {
            email:    "#{email}"
            password: "#{password}"
            passwordConfirmation: "#{password_confirmation}"
          }
        ) {
          id
          email
          createdAt
          updatedAt
        }
      }
    GRAPHQL
  end

  before do
    post_request
  end

  describe 'POST' do
    context 'when params are valid' do
      it 'returns a json with created user' do
        expect(mutation_response).to include(email: email)
      end
    end

    context 'when params are invalid' do
      let(:password_confirmation) { Faker::Internet.password }

      it 'returns errors inside the json' do
        expect(json_response[:errors]).to contain_exactly(hash_including(
          message: /\w+/, path: ['signUp']
        ))
      end
    end
  end

  describe 'arguments' do
    subject { described_class }

    it { is_expected.to accept_argument(:email).of_type('String!') }
    it { is_expected.to accept_argument(:password).of_type('String!') }
    it { is_expected.to accept_argument(:password_confirmation).of_type('String!') }
  end

  describe 'documentation' do
    it 'returns general description' do
      expect(described_class.description).to eq(
        I18n.t('graphql.mutations.sign_up.description')
      )
    end

    it 'returns email description' do
      expect(described_class.arguments['email'].description).to eq(
        I18n.t('graphql.mutations.sign_up.arguments.email')
      )
    end

    it 'returns password description' do
      expect(described_class.arguments['password'].description).to eq(
        I18n.t('graphql.mutations.sign_up.arguments.password')
      )
    end

    it 'returns password_confirmation description' do
      expect(described_class.arguments['passwordConfirmation'].description).to eq(
        I18n.t('graphql.mutations.sign_up.arguments.password_confirmation')
      )
    end
  end
end
