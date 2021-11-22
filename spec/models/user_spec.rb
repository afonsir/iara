# frozen_string_literal: true

require 'rails_helper'

describe User, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }

    it 'is valid with valid attributes' do
      expect(build(:user)).to be_valid
    end
  end
end
