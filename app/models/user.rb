# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :validatable

  include Authentication::ChangeEmailToLogin

  has_many :costs, dependent: :destroy

  validates :login, uniqueness: true
  validates :password, length: { minimum: 6 }
end
