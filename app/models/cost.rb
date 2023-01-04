# frozen_string_literal: true

class Cost < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :amount, presence: true
end
