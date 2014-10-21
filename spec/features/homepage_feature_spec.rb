require 'rails_helper'
require_relative 'helpers/user_helpers'

include SessionHelpers

describe "maps" do

  context "viewing on homepage" do

    it 'should display a map' do
      visit '/'
      expect(page).to have_css('#map')
    end

  end

  context "no fhellows on map" do

	  it 'should not have markers before users are created' do
	     expect(page).to_not have_css '.lat'
	     expect(page).to_not have_css '.lng'
	  end
	end

  context "one fhellow on map", js: true do
    before do
      User.create(email: "barnany@barnany.com",
            password: "123456789",
            latitude: 51.525803,
            longitude: -0.088277,
            bio: 'Whatevs')
    end

    # it "should be able to place a marker for a fhellow's location" do

    #   visit '/'
    #   expect(page).to have_css '.lat'
    #   expect(page).to have_css '.lng'
    # end
  end

#  context "many fhellows on map" do
    #before do
      #User.create(email: "barnany@barnany.com",
            #password: "123456789",
            #latitude: 51.525803,
            #longitude: -0.088277)
      #User.create(email: "Juan@juan.com",
            #password: "123456789",
            #latitude: 51.525804,
            #longitude: -0.088277)
    #end

    #it "should be able to place many markers to indicate fhellow locations", js: true do
      #visit '/'
      #marker_count = page.evaluate_script('map.markers.filter(function(marker) { return marker.class === "user-marker"; }).length;')
      #expect(marker_count).to eq(2)
    #end
  #end

end



describe 'links' do
  context 'activity page' do
  	# it 'when clicked and user has not signed in, user is directed to Sign In page' do 
   #    visit '/'
   #    click_link 'Activity'
   #    expect(current_path).to eq '/users/sign_in'
  	# end 

    it 'when clicked and user has signed up, the activity page link goes to the activity page' do
      user_sign_up
      add_basic_details
      visit '/'
      click_link 'Activity'
      expect(current_path).to match /activity/
    end
  end

  context 'message page' do
    it 'cannot be accessed if the person is not logged in' do
      visit '/'
      expect(page).not_to have_content 'Messages'
    end

    it 'can be accessed once a person is logged in' do
      user_sign_up
      add_basic_details
      visit '/'
      expect(page).to have_content 'Messages'
    end
  end
end
