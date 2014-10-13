require 'rails_helper'

describe 'user summaries' do 
  context 'when no user has been added' do 
  	it 'should display no users added' do 
      visit '/'
      expect(page).to have_content 'This is where users will show'
  	end 
  end 


end 