# frozen_string_literal: true

require 'rails_helper'

describe Geo do
  let(:srid) { 4326 }

  describe '::SRID' do
    it { expect(described_class::SRID).to eq srid }
  end

  describe '.point' do
    subject(:point) { described_class.point(longitude, latitude) }

    let(:latitude)  { Faker::Address.latitude }
    let(:longitude) { Faker::Address.longitude }

    it { expect(point.latitude).to eq latitude }
    it { expect(point.longitude).to eq longitude }
    it { expect(point.srid).to eq srid }
  end

  describe '.to_wkt' do
    let(:geo_point)     { build(:geo_point) }
    let(:wkt_geo_point) { "srid=#{srid};#{geo_point}" }

    it { expect(described_class.to_wkt(geo_point)).to eq wkt_geo_point }
  end
end
