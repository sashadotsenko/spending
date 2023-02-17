# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :validatable

  include Auth::ChangeEmailToLogin

  has_many :costs, dependent: :destroy
  has_many :authentications, dependent: :destroy

  validates :login, uniqueness: true
  validates :password, length: { minimum: 6 }

  def from_omniauth(auth)
    case auth[:provider]
    when 'google_oauth2' then self.login = auth[:info][:email]
    when 'github' then self.login = auth[:info][:nickname]
    end
    self.password = SecureRandom.hex(15)
    authentications.build(provider: auth[:provider], uid: auth[:uid])
  end
end
