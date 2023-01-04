# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    login { 'test' }
    password { '123456' }
  end
end
