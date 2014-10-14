require 'rails_helper'
require_relative 'helpers/user_helpers'

include SessionHelpers

describe 'user profiles' do 
	
  context 'a user has just signed up' do 
  	
  	it 'gets taken to the edit page after signing up' do 
      user_sign_up
      expect(current_path).to eq '/users/edit_profile'
	  end 

    it 'can edit profile details' do
      user_sign_up
      
    end

  end 
end
