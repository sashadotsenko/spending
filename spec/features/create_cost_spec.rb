# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Create cost' do
  let(:user) { create(:user) }

  before do
    create(:category)
  end

  it 'User create a cost' do
    visit 'users/sign_in'

    within('#new_user') do
      fill_in 'Login', with: user.login
      fill_in 'Password', with: user.password
    end

    click_button 'Log in'

    visit 'costs'

    click_link 'Create Cost'
    within('.new_cost') do
      select 'test', from: 'Category', match: :first
      fill_in 'Amount($)', with: '12.34'
      fill_in 'Description', with: 'Some Description'
    end

    click_button 'Add Cost'

    expect(page).to have_link('Create Cost')
  end
end
