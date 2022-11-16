require 'rails_helper'

RSpec.feature 'Logins', type: :feature do
  background { visit new_user_session_path }
  scenario 'user can login' do
    fill_in 'user_email', with: 'ujvari65@gmail.com'
    fill_in 'user_password', with: '123456', match: :prefer_exact
      expect(page).to have_content('Remember me')
  end

  scenario 'user can not login with wrong password' do
    fill_in 'user_email', with: 'gmail.com'
    fill_in 'user_password', with: '3456', match: :prefer_exact
    expect(page).to have_content('Forgot your password?')
  end

  scenario 'user can not login with wrong email' do
    fill_in 'user_email', with: 'gmail.com'
    fill_in 'user_password', with: '123456', match: :prefer_exact
    expect(page).to have_content('Forgot your password?')
  end



end
