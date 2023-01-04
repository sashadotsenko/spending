# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :costs, dependent: :restrict_with_exception
end
