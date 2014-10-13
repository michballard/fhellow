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
    it "should have a link for the 'About' page" do
      visit '/'
      expect(page).to have_link 'About'
    end

    it "should have an activity nav link" do
      visit '/'
      expect(page).to have_link 'Activity'
    end
  end
end
