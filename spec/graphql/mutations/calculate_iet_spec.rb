# frozen_string_literal: true

require 'rails_helper'

describe Mutations::CalculateIet, type: :request do
  subject(:mutation_reponse) { json_response[:data][:calculateIet] }

  let(:cl_in_micrograms) { 10.0 }
  let(:pt_in_micrograms) { 5.0 }

  let(:query) do
    <<-GRAPHQL
      mutation {
        calculateIet(
          input: {
            clInMicrograms: #{cl_in_micrograms}
            ptInMicrograms: #{pt_in_micrograms}
            locationType: reservatorios
          }
        ) {
          ietValue
          ietCategory
        }
      }
    GRAPHQL
  end

  before do
    post_request
  end

  describe 'POST' do
    context 'when params are valid' do
      it 'returns a json with calculated iet value and category' do
        expect(mutation_reponse).to include(
          ietCategory: 'oligotrofico', ietValue: be_within(0.00005).of(51.11907)
        )
      end
    end

    context 'when params are invalid' do
      let(:cl_in_micrograms) { 0.0 }

      let(:error_message) do
        I18n.t('errors.custom.invalid_cl_and_pt_in_micrograms', count: 0)
      end

      it 'returns errors inside the json' do
        expect(json_response[:errors]).to contain_exactly(hash_including(
          message: error_message, path: ['calculateIet']
        ))
      end
    end
  end
end