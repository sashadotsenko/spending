# frozen_string_literal: true

module Costs
  class FilterQuery
    def initialize(params, current_user)
      @category_id = params[:category_id] if params[:category_id].present?
      @amount_min = params[:amount_min] if params[:amount_min]
      @amount_max = params[:amount_max] if params[:amount_max]
      @current_user = current_user
    end

    def call
      @costs = Cost.all.includes(:category).where(user_id: @current_user.id)

      if @amount_min && @amount_max
        @costs = @costs.filter_by_amount(@amount_min, @amount_max)
      elsif @category_id
        @costs = @costs.filter_by_category_id(@category_id)
      else
        @costs
      end
    end
  end
end
