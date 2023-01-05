# frozen_string_literal: true

FactoryBot.define do
  factory :cost do
    description { 'test' }
    amount { 1 }

    trait :fake_cost do
      description { 'Some description' }
      amount { Faker::Commerce.price }
    end
  end
end
