# frozen_string_literal: true

class Cost < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :amount, presence: true, numericality: {
    less_than_or_equal_to: 10_000,
    only_numeric: true,
    message: 'Numbers only, less than 10000.'
  }

  scope :filter_by_category_id, ->(category_id) { where(category_id:) }
  scope :filter_by_amount, lambda { |min, max|
    min = 0 if min.empty?
    max = Float::INFINITY if max.empty?

    where('amount >= ? AND amount <= ?', min, max)
  }
end
