require 'rails_helper'

describe "maps" do

  context "viewing on homepage" do

    it 'should display a map' do
      visit '/'
      expect(page).to have_css('#map')
    end

  end

end

describe "navigation" do
  context "displaying a nav bar" do

    it "should have the fhellow logo" do
      visit '/'
      expect(page).to have_css '#logo'
    end

    it "should have a link for the 'About' page" do
      visit '/'
      expect(page).to have_link 'About'
    end

    it "should have an activity nav link" do
      visit '/'
      expect(page).to have_link 'Activity'
    end

    it "should have a link for 'Post' page" do
      visit '/'
      expect(page).to have_link 'Post'
    end

    it "should have a link to join as a user" do
      visit '/'
      expect(page).to have_link 'Join'
    end

    it "should have a link for 'Log in' page" do
      visit '/'
      expect(page).to have_link 'Log in'
    end
  end
end
