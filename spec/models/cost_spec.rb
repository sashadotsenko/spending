# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Cost do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:category) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:amount) }
  end
end
