require 'rails_helper'

describe 'relationships' do

  context 'a signed in user', js: true do
      before(:each) do
        @barnany = create_barnany
        @gemma = create_gemma
      end

    it 'should be able to follow a fhellow' do
      sign_in("barnany@barnany.com")
      find(".add-#{@gemma.id}").click
      expect(page).to have_content("Added")
    end

    it 'should be able to unfollow a fhellow who they follow' do 
      sign_in("barnany@barnany.com")
      find(".add-#{@gemma.id}").click
      expect(page).to have_content("Added")
      find(".add-#{@gemma.id}").click
      expect(page).to have_content("Add")
    end
  end


    # it 'should have a counter showing how many people follow them' do 
    #   sign_in("barnany@barnany.com")
    #   find(".add-#{@gemma.id}").click

    # end

end