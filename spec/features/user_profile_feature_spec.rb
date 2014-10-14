require 'rails_helper'
require_relative 'helpers/user_helpers'

include SessionHelpers

describe 'user profiles' do 
	
  context 'a user has just signed up' do 
  	
  	it 'gets taken to the edit page after signing up' do 
      user_sign_up
      expect(current_path).to eq "/users/#{(/[0-9]+/)}/edit_profile"
	  end 

    it 'can edit profile details' do
      user_sign_up
      fill_in('First name', with: 'Barnany')
      fill_in('Last name', with: 'Shute')
      fill_in('Email', with: 'barnany@barnany.com')
      fill_in('Job title', with: 'Freelance film maker')
      fill_in('#country', with: 'United Kingdom')
      fill_in('#town', with: 'London')
      fill_in('Website', with: "http://www.barnany.com")
      fill_in('Linkedin', with: "http://linkedin.com/in/barnany")
      fill_in('#bio', with: "Hi I'm Barney")
      click_button('Create my profile')
      expect(current_path).to eq '/user/show'
      expect(page).to have_content('Barnany Shute')
      expect(page).to have_content('Freelance film maker')
      expect(page).to have_content('London, United Kingdom')
      expect(page).to have_content('Hi I\'m Barney')
    end



  end 
end
