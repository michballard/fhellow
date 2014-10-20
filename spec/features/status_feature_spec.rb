require 'rails_helper'
require_relative 'helpers/user_helpers'
require_relative 'helpers/post_helpers'

include SessionHelpers

describe 'statuses' do 

  context 'a signed in user' do 

    before(:each) do
      @bob = User.create(email: 'bob@test.com', password: '1234567890', password_confirmation: '1234567890')
    	visit '/users/sign_in'
      fill_in('Email', with: 'bob@test.com')
      fill_in('Password', with: '1234567890')   
    end

    it 'will initially have no status' do  	
      visit "/users/#{@bob.id}/show"
      expect(page).to have_content "No status set"
      expect(page).to have_link "Current status"
    end 

    it 'can have a status added' do 
      visit "/users/#{@bob.id}/show"
      click_link "Current status"
      fill_in('status[current_status]', with: 'Here is my new status')
      click_button "Update status"
      expect(current_path).to match "/users/#{@bob.id}/show"
      expect(page).not_to have_content "No status set"
      expect(page).to have_content 'Here is my new status'
    end

    it 'can have a status changed' do 
      visit "/users/#{@bob.id}/show"
      click_link "Current status"
      fill_in('status[current_status]', with: 'Here is my new status')
      click_button "Update status"
      click_link "Current status"
      fill_in('Status', with: 'Here is my updated status')
      click_button "Update status"
      expect(page).not_to have_content "Here is my new status"
      expect(page).to have_content 'Here is my updated status'      
    end 

  end

end 