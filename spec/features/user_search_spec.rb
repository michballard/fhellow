require 'rails_helper'
require_relative 'helpers/user_helpers'

include SessionHelpers

describe 'Searching for fhellows on the homepage' do 

	context 'JSON response by interests' do 
		before do
			create_barnany
			create_gemma
		end

		it 'json returns all users when no interest params are given' do 
			visit '/api/users'
			expect(page).to have_content 'Barnany'
			expect(page).to have_content 'Gemma'
		end

		it "json returns only those with lunch-buddy param is true" do 
			visit '/api/users?interests=lunch-buddy'
			expect(page).to have_content 'Barnany'
			expect(page).not_to have_content 'Gemma'
		end
	end



end