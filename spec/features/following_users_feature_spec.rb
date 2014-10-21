require 'rails_helper'
require_relative 'helpers/user_helpers'

include SessionHelpers

describe 'relationships' do

  context 'a signed in user', js: true do
    before(:each) do
      @barnany = create_barnany
      @gemma = create_gemma
      @tom = create_tom
    end

    it 'should be able to follow a fhellow' do
      sign_in("barnany@barnany.com")
      find(".profile-#{@gemma.id}").click
      click_link("Follow")
      expect(page).to have_content("Following")
    end

    it 'should be able to unfollow a fhellow who they follow' do
      sign_in("barnany@barnany.com")
      find(".add-#{@gemma.id}").click
      expect(page).to have_content("Following")
      find(".add-#{@gemma.id}").click
      expect(page).to have_content("Follow")
    end
  end

    xit 'should have a counter showing how many people follow them' do 
      sign_in("barnany@barnany.com")
      find(".add-#{@gemma.id}").click

    end

    xit 'should have a counter showing how many people they are following' do 
      sign_in("barnany@barnany.com")
      find(".add-#{@gemma.id}").click

    end

    xit 'should display list of followers' do 

    end 

    xit 'should display list of people they are following' do 

    end 

end
