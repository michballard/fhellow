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
      visit homepage_path
      expect(page).to have_link 'About'
    end
  end
end
