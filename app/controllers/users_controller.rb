# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :user, only: %i[show]

  def show
    @costs = @user.costs.includes(:category)
  end

  private

  def user
    @user = User.find(params[:id])
  end
end
