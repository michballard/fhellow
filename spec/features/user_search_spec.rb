require 'rails_helper'
require_relative 'helpers/user_helpers'

include SessionHelpers

describe 'Searching for fhellows on the homepage' do 

	context 'Filtering by interests', js: true do 
		before do
			create_barnany
			create_gemma
		end

		it 'displays all users when no filters are selected' do 
			visit '/'
			expect(page).to have_content 'Barnany'
			expect(page).to have_content 'Gemma'
		end

		it "displays only those interested in having lunch buddies when it's selected" do 
			visit '/'
			check('lunch-buddy')
			expect(page).to have_content 'Barnany'
			expect(page).not_to have_content 'Gemma'
		end
	end



end