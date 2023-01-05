# frozen_string_literal: true

module CostHelper
  def total_amount(costs)
    costs.pluck(:amount).sum
  end
end
