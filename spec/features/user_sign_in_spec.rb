# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User sign in' do
  let(:user) { create(:user) }

  it 'User sign in' do
    visit 'users/sign_in'

    within('#new_user') do
      fill_in 'Login', with: user.login
      fill_in 'Password', with: user.password
    end

    click_button 'Log in'

    expect(page).to have_content('Home page!')
  end
end
