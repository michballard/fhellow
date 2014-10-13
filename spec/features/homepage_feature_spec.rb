require 'rails_helper'

describe "maps" do

  context "viewing on hompage" do

    it 'should display a map' do
      visit '/'
      expect(page).to have_css('.map')
    end

  end


end
