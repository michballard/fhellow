require 'rails_helper'
require_relative 'helpers/user_helpers'
require_relative 'helpers/post_helpers'

include SessionHelpers

describe 'posts' do
  context 'adding a post' do

    it 'a person can post a note when logged in' do
      user_sign_up
      add_basic_details
      click_button 'Create my profile'
      add_post
      expect(current_path).to match /activity\/\d+/
      expect(page).to have_content "I'm so happy"
    end

    it 'has the persons name showing on the post' do
      user_sign_up
      add_basic_details
      click_button 'Create my profile'
      add_post
      expect(page).to have_content 'Barnany Shute'
    end

    it 'has the time created on the post' do
      user_sign_up
      add_basic_details
      click_button 'Create my profile'
      add_post
      expect(page).to have_content 'less than a minute ago'
    end

    it 'allows an image to be added to a post' do
      user_sign_up
      add_basic_details
      click_button 'Create my profile'
      visit '/'
      click_link 'Post'
      fill_in 'Content', with: "I'm so happy!"
      attach_file 'post[image]', ('spec/fixtures/images/post_pics/post_1.jpg')
      click_button 'Post'
      expect(page).to have_css('.post_image')
    end
  end

  context 'editing a post' do
  	it 'allows a user to edit a post from the activity page' do
      user_sign_up
      add_basic_details
      click_button 'Create my profile'
      add_post
      click_link 'Edit post'
      fill_in 'Content', with: "I'm not happy!"
      click_on 'Update Post'
      expect(current_path).to match /activity\/\d+/
      expect(page).to have_content "I'm not happy!"
  	end
  end

  context 'displaying posts' do
    it 'should show the posts on the activity index page' do
      user_sign_up
      add_basic_details
      click_button 'Create my profile'
      add_post
      click_link 'Sign out'
      click_link 'Activity'
      expect(current_path).to eq activity_path
    end
  end
end

# describe 'posts with location' do
#   context 'from homepage' do
#     it 'a person can add their current location to a post by clicking button', js: true do
#       user_sign_up
#       add_basic_details
#       click_button 'Create my profile'
#       visit '/'
#       click_link 'Post'
#       fill_in 'Content', with: "I'm so happy!"
#       click_button('Add current location')
#       click_button 'Post'
#       expect(page).to have_css('#latlngresult')
#     end
#   end
# end
