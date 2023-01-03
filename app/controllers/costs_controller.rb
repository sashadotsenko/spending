# frozen_string_literal: true

class CostsController < ApplicationController
  before_action :set_cost, only: %i[show edit update destroy]
  def index
    @costs = Cost.where(user_id: current_user.id)
  end

  def show; end

  def new
    @cost = Cost.new
  end

  def create
    if Cost.create!(cost_params)
      redirect_to costs_path
    else
      redirect_to new_cost_path
    end
  end

  def edit; end

  def update
    if @cost.update!(cost_params)
      redirect_to cost_path(@cost)
    else
      redirect_to edit_cost_path(@cost)
    end
  end

  def destroy
    if @cost.destroy
      redirect_to costs_path
    else
      redirect_to edit_cost_path(@cost)
    end
  end

  private

  def cost_params
    params.require(:cost).permit(:description, :amount, :user_id)
  end

  def set_cost
    @cost = Cost.find(params[:id])
  end
end
