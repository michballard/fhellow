require 'rails_helper'
require_relative 'helpers/user_helpers'

include SessionHelpers

describe 'sending messages' do 

  def sign_in_user_one
    user_sign_up
    add_basic_details
  end

  def sign_in_user_two
    second_user_sign_up
    second_user_add_basic_details
  end

  context 'a signed in user', js: true do 

  	it 'can send a message' do 
  		sign_in_user_one
      visit '/message/1'
      fill_in('message', :with => 'Hello')
      find_button('Send').click
      expect(current_path).to eq '/message/1'
      expect(page).to have_content('Hello')
  	end 

  	xit 'can receive a message' do 
      sign_in_user_one
      visit '/message/2'
      fill_in('message', :with => 'Hello 2')
      find_button('Send').click
      click_link 'Sign out'
      sign_in_user_two
      visit '/message/1'
      expect(page).to have_content('Hello 2')
  	end 

  	xit 'can view history of messages' do 
      sign_in_user_one
      visit '/message/2'
      fill_in('message', :with => 'Hello 2')
      find_button('Send').click
      click_link 'Sign out'
      sign_in_user_two
      visit '/message/1'
      fill_in('message', :with => 'Hello 1!')
      find_button('Send').click
      visit '/messages'
      expect(page).to have_content('Hello 2')
      expect(page).to have_content('Hello 1!')    
  	end 

  end 

end 