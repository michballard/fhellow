require 'rails_helper'

describe "maps" do

  context "viewing on homepage" do

    it 'should display a map' do
      visit '/'
      expect(page).to have_css('#map')
    end

  end

  context "placing fhellows on the map" do

  it 'should not have markers before users are created' do
     expect(page).to_not have_css '.lat'
     expect(page).to_not have_css '.lng'
  end

    before do
      User.create(email: "barnany@barnany.com", 
            password: "123456789", 
            latitude: 51.525803,
            longitude: -0.088277)
    end

    it "should be able to place a marker for a fhellow's location" do
      visit '/'      
      expect(page).to have_css '.lat'
      expect(page).to have_css '.lng'
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
