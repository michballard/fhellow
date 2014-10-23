require "rails_helper"
require_relative 'helpers/user_helpers'

include SessionHelpers

describe "navigation" do

  context "displaying a nav bar" do

    it "should have the fhellow logo" do
      visit '/'
      expect(page).to have_css '#logo'
    end

    it "the Fhellow logo links to the home page" do
      bob = User.create(email: 'bob@bob.com', password: 'password')
      visit "/activity/#{bob.id}"
      click_link 'FHELLOW'
      expect(current_path).to eq '/'
    end

    it "should have a link for the 'About' page if user is signed out" do
      visit '/'
      expect(page).to have_link 'About'
    end

    it "should not have a link to the 'About' page if user is signed in" do
      user_sign_up
      visit '/'
      expect(page).not_to have_link 'About'
    end

    it "should have an activity nav link" do
      visit '/'
      expect(page).to have_link 'Activity'
    end

    it "should have a link for 'Post' page" do
      visit '/'
      expect(page).not_to have_link 'Post'
      user_sign_up
      visit '/'
      expect(page).to have_link 'Post'
    end

    it "should have a button to join as a user" do
      visit '/'
      expect(page).to have_button 'Join'
    end

    it "should have a button for 'Log in' page" do
      visit '/'
      expect(page).to have_button 'Log in'
    end
  end
end
