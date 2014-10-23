require 'rails_helper'
require_relative 'helpers/user_helpers'
require_relative 'helpers/post_helpers'

include SessionHelpers

describe 'posts' do
  context 'adding a post' do
    before(:each) do
      user_sign_up
      add_basic_details
    end

    it 'allows an image to be added to a post' do
      visit '/'
      click_link 'Post'
      fill_in 'Content', with: "I'm so happy!"
      attach_file 'post[image]', ('spec/fixtures/images/post_pics/post_1.jpg')
      click_button 'Post'
      expect(page).to have_css('.post-image')
    end

      it 'a person can post a note when logged in' do
      add_post
      expect(current_path).to match /activity\/\d+/
      expect(page).to have_content "I'm so happy"
    end

    it 'has the persons name showing on the post' do
      add_post
      expect(page).to have_content 'Barnany Shute'
    end

    it 'has the time created on the post' do
      add_post
      expect(page).to have_content 'less than a minute ago'
    end

  end

  context 'editing a post' do

    before do
      user_sign_up
      add_basic_details
      add_post
    end

  	it 'allows a user to edit a post from the activity page' do
      click_link 'Edit post'
      fill_in 'Content', with: "I'm not happy!"
      click_on 'Edit Post'
      expect(current_path).to match /activity\/\d+/
      expect(page).to have_content "I'm not happy!"
  	end

    it 'only the person that created the post can edit the post' do
      click_link 'Sign out'
      user_sign_up("alisa@barnany.com")
      second_user_add_basic_details
      visit '/activity'
      expect(page).not_to have_content 'Edit post'
    end
  end

  context 'displaying posts' do
    before(:each) do
      user_sign_up
      add_basic_details
      add_post
      click_link 'Sign out'
      click_link 'Activity'
    end

    it 'should show the posts on the activity index page' do
       expect(current_path).to match /activity\/\d+/
    end

    it 'the index page shows all submitted posts' do
      expect(page).to have_content "I'm so happy!"
    end

    it 'posts on the activity index page should show the users name' do
      expect(page).to have_content 'Barnany Shute'
    end

    it 'posts timestamp should be displayed in words' do
      expect(page).to have_content 'less than a minute ago'
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
