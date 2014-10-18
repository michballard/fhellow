require 'rails_helper'

describe 'relationships' do

  context 'a signed in user' do

    it 'should be able to follow a fhellow' do
      user_sign_up
      add_basic_details
      click_button "Create my profile"
      click_link "Sign out"
      second_user_sign_up
      second_user_add_basic_details
      click_button "Create my profile"
      visit '/'
      click_button "Add"
      expect(page).to have_content("Added")
    end

  end

end