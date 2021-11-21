# frozen_string_literal: true

FactoryBot.define do
  factory :user, class: 'User' do
    email      { Faker::Internet.unique.email }
    password   { Faker::Internet.password }
    created_at { Time.zone.now }
    updated_at { Time.zone.now }
  end
end
