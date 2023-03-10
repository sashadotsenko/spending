# frozen_string_literal: true

class AuthenticationsController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    authentication = Authentication.find_by(provider: auth[:provider], uid: auth[:uid])
    if authentication
      sign_in_and_redirect(:user, authentication.user)
    elsif current_user
      current_user.authentications.create!(provider: auth[:provider], uid: auth[:uid])
      redirect_to root_path
    else
      user = User.new
      user.from_omniauth(auth)
      if user.save
        sign_in_and_redirect(:user, user)
      else
        redirect_to root_path, alert: user.errors.full_messages.join("\n")
      end
    end
  end

  private

  def auth
    @auth ||= request.env['omniauth.auth']
  end
end
