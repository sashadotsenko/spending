# frozen_string_literal: true

class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @costs = Cost.includes(:category, :user)
  end
end
