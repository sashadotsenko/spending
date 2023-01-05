# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User sign up' do
  it 'User sign in' do
    visit 'users/sign_up'

    within('#new_user') do
      fill_in 'Login', with: 'test'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
    end

    click_button 'Sign up'

    expect(page).to have_content('All Costs!')
  end
end
