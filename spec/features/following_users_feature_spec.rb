require 'rails_helper'

describe 'relationships' do

  context 'a signed in user', js: true do


    it 'should be able to follow a fhellow' do
      user_sign_up
      add_basic_details
      click_link "Sign out"
      user_sign_up("alisa@barnany.com")
      second_user_add_basic_details
      visit '/'
      find(".add-Alisa")
      expect(page).to have_content("Added")
    end

  end

end