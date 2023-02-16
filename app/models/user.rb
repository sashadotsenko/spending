# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :validatable

  include Auth::ChangeEmailToLogin

  has_many :costs, dependent: :destroy
  has_many :authentications, dependent: :destroy

  validates :login, uniqueness: true
  validates :password, length: { minimum: 6 }

  def from_omniauth(auth)
    self.login = auth[:info][:email]
    self.password = SecureRandom.hex(15)
    authentications.build(provider: auth[:provider], uid: auth[:uid])
  end
end
