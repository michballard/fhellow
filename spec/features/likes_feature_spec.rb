require 'rails_helper'

describe 'liking posts' do

	before do 
    @bob = User.create(email: 'bob@test.com', password: '1234567890', name_first: 'Bob')
    @bob.posts.create(content: 'Here is my post')
	end 

	context 'a guest user' do 

		it 'can not like a post' do 
      visit '/'
      click_link 'Activity'
      expect(page).not_to have_link 'Like'
		end 

	end 

	context 'a signed in user' do 
    
    xit 'can see a link to like a post' do 
      sign_in(bob@test.com)
      visit '/'
      click_link 'Activity'
      expect(page).to have_link 'Like'  
    end 
	end 

end
