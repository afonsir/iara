# frozen_string_literal: true

require 'rails_helper'

describe CreateUser, type: :interactor do
  subject(:interactor) { described_class.call(params) }

  let(:params) do
    {
      email:                 Faker::Internet.email,
      password:              password,
      password_confirmation: password_confirmation
    }
  end

  let(:password)              { Faker::Internet.password }
  let(:password_confirmation) { password }

  describe '.call' do
    context 'when params are valid' do
      it { is_expected.to be_a_success }

      it 'creates an user record' do
        expect { interactor }.to change(User, :count).by(1)
      end
    end

    context 'when any param is invalid' do
      let(:password_confirmation) { Faker::Internet.password }

      it { is_expected.to be_a_failure }

      it 'returns an error message inside context' do
        expect(interactor.error).not_to be_nil
      end
    end
  end
end
