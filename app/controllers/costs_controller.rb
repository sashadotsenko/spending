# frozen_string_literal: true

class CostsController < ApplicationController
  before_action :set_cost, only: %i[show edit update destroy]
  before_action :set_categories, only: %i[index new edit]

  def index
    @costs = Costs::FilterQuery.new(params, current_user).call
  end

  def show; end

  def new
    @cost = Cost.new
  end

  def edit; end

  def create
    if Cost.create(cost_params).valid?
      redirect_to costs_path
    else
      redirect_to new_cost_path
    end
  end

  def update
    if @cost.update(cost_params)
      redirect_to cost_path(@cost)
    else
      redirect_to edit_cost_path(@cost)
    end
  end

  def destroy
    if @cost.destroy
      redirect_to costs_path
    else
      redirect_to costs_path, status: :bad_request
    end
  end

  private

  def cost_params
    params.require(:cost).permit(:description, :amount, :user_id, :category_id)
  end

  def set_cost
    @cost = Cost.find(params[:id])
  end

  def set_categories
    @categories = Category.pluck(:name, :id)
  end
end
