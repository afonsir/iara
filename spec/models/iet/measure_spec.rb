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

    let(:type_values) { { reservatorios: 0, rios: 1 } }

    it { is_expected.to validate_presence_of(:coords) }
    it { is_expected.to validate_presence_of(:category) }
    it { is_expected.to validate_presence_of(:type) }
    it { is_expected.to validate_presence_of(:value) }

    it { is_expected.to validate_numericality_of(:value).is_greater_than_or_equal_to(0) }

    it { is_expected.to define_enum_for(:type).with_values(type_values) }
    it { is_expected.to define_enum_for(:category).with_values(category_values) }

    it 'is valid with valid attributes' do
      expect(build(:measure)).to be_valid
    end
  end
end
