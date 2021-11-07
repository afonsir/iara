# frozen_string_literal: true

require 'rails_helper'

describe IET::Measure, type: :model do
  describe 'validations' do
    let(:category_values) do
      {
        ultraoligotrofico: 0,
        oligotrofico:      1,
        mesotrofico:       2,
        eutrofico:         3,
        supereutrofico:    4,
        hipereutrofico:    5
      }
    end

    it { is_expected.to validate_presence_of(:coords) }
    it { is_expected.to validate_presence_of(:category) }
    it { is_expected.to validate_presence_of(:value) }
    it { is_expected.to validate_numericality_of(:value) }
    it { is_expected.to define_enum_for(:category).with_values(category_values) }

    it 'is valid with valid attributes' do
      expect(build(:measure)).to be_valid
    end
  end
end
