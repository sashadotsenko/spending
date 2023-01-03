# frozen_string_literal: true

class Cost < ApplicationRecord
  belongs_to :user
  belongs_to :category
end
