require 'rails_helper'
require_relative 'helpers/user_helpers'

include SessionHelpers

describe 'relationships' do

  context 'a signed in user', js: true do

    def tom_follows_gemma_and_signs_out
      sign_in("Tom@tom.com")
      find(".profile-#{@gemma.id}").click
      find(".profile-follow-toggle").click
      find("a.dropdown-toggle").click
      click_link 'My profile'
      find("a.dropdown-toggle").click
      click_link 'Sign out'
    end

    def barney_follows_gemma
      sign_in("barnany@barnany.com")
      find(".profile-#{@gemma.id}").click
      find(".profile-follow-toggle").click
    end

    before(:each) do
      @barnany = create_barnany
      @gemma = create_gemma
      @tom = create_tom
    end

    it 'should be able to follow a fhellow' do
      sign_in("barnany@barnany.com")
      save_and_open_page
      find(".profile-#{@gemma.id}").click
      find(".profile-follow-toggle").click
      expect(page).to have_content("Following")
    end

    it 'should be able to unfollow a fhellow who they follow' do
      barney_follows_gemma
      expect(page).to have_content("Following")
      find(".profile-follow-toggle").click
      expect(page).to have_content("Follow")
    end

    it 'can see a counter with one follower' do
      barney_follows_gemma
      expect(page).to have_content("1 Follower")
    end

    it 'can see a counter with many followers' do
      tom_follows_gemma_and_signs_out
      barney_follows_gemma
      expect(page).to have_content("2 Followers")
    end

    it 'can see a counter with one following' do
      barney_follows_gemma
      visit "/users/#{@barnany.id}/show"
      expect(page).to have_content("1 Following")
    end

    xit 'can see a list of followers' do
      tom_follows_gemma_and_signs_out
      barney_follows_gemma
      find('.followers').click
      expect(current_path).to match "/users/#{@gemma.id}/follower"
      expect(page).to have_content("Barnany Shute")
    end

    xit 'can see a list of following' do
      barney_follows_gemma
      visit "/users/#{@barnany.id}/show"
      find('.following').click
      expect(current_path).to match "/users/#{@barnany.id}/following"
      expect(page).to have_content("Gemma Gaven")
    end

  end

end
