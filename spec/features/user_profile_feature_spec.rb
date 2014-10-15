require 'rails_helper'
require_relative 'helpers/user_helpers'

include SessionHelpers

describe 'user profiles' do

  context 'a user has just signed up' do

  	it 'gets taken to the edit page after signing up' do
      user_sign_up
      expect(current_path).to match /users\/\d+\/edit_profile/
	  end

    it 'can edit basic profile details' do
      user_sign_up
      expect(page).to have_content('First name')
      add_basic_details
      click_button('Create my profile')
      expect(current_path).to match /users\/\d+\/show/
      expect(page).to have_content('Barnany Shute')
      expect(page).to have_content('Freelance film maker')
      expect(page).to have_content('Hi I\'m Barney')
    end

    it 'can add a location' do
      user_sign_up
      add_basic_details
      fill_in('user[country]', with: 'United Kingdom')
      fill_in('user[town]', with: 'London')
      click_button('Create my profile')
      expect(page).to have_content('London, United Kingdom')
    end

    it 'can add website and LinkedIn details' do
      user_sign_up
      add_basic_details
      fill_in('user[website]', with: "www.barnany.com")
      fill_in('user[linkedin]', with: "linkedin.com/in/barnany")
      click_button('Create my profile')
      expect(page).to have_content('www.barnany.com')
      expect(page).to have_content('linkedin.com/in/barnany')
    end

    it 'can add a profile image' do
      user_sign_up
      add_basic_details
      attach_file 'user[avatar]', ('spec/fixtures/images/avatar.jpg')
      click_button('Create my profile')
      expect(page).to have_css('.avatar')
      # expect(@user.avatar_file_name).to eq "avatar.jpg"
    end
  end

  context 'a user is signed in' do

    it 'is able to sign out' do
      user_sign_up
      visit '/'
      click_link "Sign out"
      expect(page).to have_content "Signed out successfully"
    end

    it 'should have a show page' do
      user_sign_up
      add_basic_details
      check("Discussing ideas")
      check("Afterwork drinks")
      check("Collaborating")
      check("Chat over a coffee")
      check("Lunch buddy")
      check("Advising")
      click_button('Create my profile')
      expect(page).to have_content("Discussing ideas")
      expect(page).to have_content("Afterwork drinks")
      expect(page).to have_content("Collaborating")
      expect(page).to have_content("Chat over a coffee")
      expect(page).to have_content("Lunch buddy")
      expect(page).to have_content("Advising")
      end
  end
end
