# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    name { 'test' }

    trait :traveling do
      name { 'Traveling' }
    end

    trait :clothing do
      name { 'Clothing' }
    end

    trait :taxi do
      name { 'Taxi' }
    end

    trait :cafes do
      name { 'Cafes' }
    end

    trait :shops do
      name { 'Shops' }
    end

    trait :other do
      name { 'Other' }
    end
  end
end
