# frozen_string_literal: true

require 'rails_helper'

describe GenerateToken, type: :interactor do
  subject(:interactor) { described_class.call(params) }

  let(:params) do
    {
      email:    email,
      password: password
    }
  end

  let(:email)    { Faker::Internet.email }
  let(:password) { Faker::Internet.password }

  let(:validation_message) do
    I18n.t('errors.custom.invalid_authentication')
  end

  describe '.call' do
    context 'when params are valid' do
      before do
        create(:user, email: email, password: password)
      end

      it { is_expected.to be_a_success }

      it 'returns a token' do
        expect(interactor.token).not_to be_nil
      end
    end

    context 'when email does not any user' do
      it { is_expected.to be_a_failure }

      it 'returns an error message inside context' do
        expect(interactor.error).to eq validation_message
      end
    end

    context 'when password is invalid' do
      let(:password) { 'any_password' }

      it { is_expected.to be_a_failure }

      it 'returns an error message inside context' do
        expect(interactor.error).to eq validation_message
      end
    end
  end
end
