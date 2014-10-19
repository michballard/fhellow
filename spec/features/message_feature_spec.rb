require 'rails_helper'
require_relative 'helpers/user_helpers'

include SessionHelpers

describe 'sending messages' do

  def john_sign_in
    visit '/'
    click_link 'Log in'
    fill_in('Email', :with => 'john@b.com')
    fill_in('Password', :with => '1234567890')
    click_button 'Log in'
  end

  def bob_sign_in
    visit '/'
    click_link 'Log in'
    fill_in('Email', :with => 'bob@b.com')
    fill_in('Password', :with => '1234567890')
    click_button 'Log in'
  end

  context 'a signed in user', js: true do

  before(:each) do
    @bob = User.create(email: 'bob@b.com', password: '1234567890', password_confirmation: '1234567890')
    @john = User.create(email: 'john@b.com', password: '1234567890', password_confirmation: '1234567890')
  end

  	it 'can send a message' do
      john_sign_in
      visit "/message/#{@bob.id}"
      fill_in('message', :with => 'Hello')
      find_button('Send').click
      expect(current_path).to eq "/message/#{@bob.id}"
      expect(page).to have_content('Hello')
  	end

  	it 'can receive a message' do
      bob_sign_in
      visit "/message/#{@john.id}"
      fill_in('message', :with => 'Hello 2')
      find_button('Send').click
      click_link 'Sign out'
      john_sign_in
      visit "/message/#{@bob.id}"
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
