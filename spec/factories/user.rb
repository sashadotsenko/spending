# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    login { 'test' }
    password { '123456' }

    trait :fake_user do
      login { Faker::Name.first_name }
    end

    trait :test_user do
      login { 'test_user' }
    end
  end
end
