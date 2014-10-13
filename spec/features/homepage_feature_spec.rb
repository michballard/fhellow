require 'rails_helper'

describe "homepage" do

    context "viewing the homepage" do

        it 'should display a map' do
            visit '/'
            expect(page).to have_css('.map')
        end

    end


end