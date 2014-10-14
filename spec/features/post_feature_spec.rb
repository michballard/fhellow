require 'rails_helper'

describe 'posts' do
  context 'from homepage' do
    before do
      User.create(email: 'ruth@example.com', password: 'password', password_confirmation: 'password')
      visit 'users/sign_in'
      fill_in 'Email', with: :email
      fill_in 'Password', with: :password
      click_button 'Log in'
    end

    it 'a person can post a note when logged in' do
      visit '/'
      click_link 'Post'
      expect(current_path).to eq 'user/post'
      fill_in 'Note', with: "I'm so happy!"
      click_button 'Post'
      expect(current_path).to eq activity_path
      expect(page).to have_content "I'm so happy"
    end
  end
end
