# frozen_string_literal: true

require 'rails_helper'

describe IET::DefineCategory, type: :interactor do
  subject(:interactor) { described_class.call(iet_value: value) }

  describe '.call' do
    shared_examples 'a valid defined category' do
      it { is_expected.to be_a_success }

      it { expect(interactor.iet_category).to eq category }
    end

    context 'when value is in hipereutrofico category' do
      let(:category) { :hipereutrofico }
      let(:value)    { 68 }

      it_behaves_like 'a valid defined category'
    end

    context 'when value is in supereutrofico category' do
      let(:category) { :supereutrofico }
      let(:value)    { 64 }

      it_behaves_like 'a valid defined category'
    end

    context 'when value is in eutrofico category' do
      let(:category) { :eutrofico }
      let(:value)    { 60 }

      it_behaves_like 'a valid defined category'
    end

    context 'when value is in mesotrofico category' do
      let(:category) { :mesotrofico }
      let(:value)    { 53 }

      it_behaves_like 'a valid defined category'
    end

    context 'when value is in oligotrofico category' do
      let(:category) { :oligotrofico }
      let(:value)    { 48 }

      it_behaves_like 'a valid defined category'
    end

    context 'when value is in ultraoligotrofico category' do
      let(:category) { :ultraoligotrofico }
      let(:value)    { 46 }

      it_behaves_like 'a valid defined category'
    end
  end
end
