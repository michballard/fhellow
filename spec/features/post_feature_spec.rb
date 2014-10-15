require 'rails_helper'
require_relative 'helpers/user_helpers'

include SessionHelpers

describe 'posts' do
  context 'from homepage' do
    before do
      User.create(email: "ruth@example.com", password: "password", password_confirmation: "password")
    end

    def login(email, password)
      visit 'users/sign_in'
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      click_button 'Log in'
    end

    it 'a person can post a note when logged in' do
      visit '/'
      login("ruth@example.com", "password")
      click_link 'Post'
      fill_in 'Content', with: "I'm so happy!"
      click_button 'Post'
      expect(current_path).to match /activity\/\d/
      expect(page).to have_content "I'm so happy"
    end

    it 'has the persons name showing on the post' do
      user_sign_up
      add_basic_details
      click_button 'Create my profile'
      visit '/'
      click_link 'Post'
      fill_in 'Content', with: "I'm so happy!"
      click_button 'Post'
      expect(current_path).to match /activity\/\d/
      expect(page).to have_content 'Barnany Shute'
    end
  end
end
