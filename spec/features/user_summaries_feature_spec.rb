require 'rails_helper'

describe 'user summaries' do
  context 'when no user has been added' do
    xit 'should display no users added' do
      visit '/'
      save_and_open_page
      expect(page).to have_content 'This is where users will show'
    end
  end

  context 'where a user has been added', js: true do
    before do
      User.create(email: "barnany@barnany.com",
                  password: "123456789",
                  name_first: "Barnany",
                  name_last: "Shute",
                  job_title: "Freelance film maker",
                  town: "London",
                  bio: "Hi I'm Barney")
    end
    it 'should display the user summary' do
      visit '/'
      expect(page).not_to have_content 'This is where users will show'
      expect(page).to have_content "Barnany"
      expect(page).to have_content "Shute"
      expect(page).to have_content "Freelance film maker"
      expect(page).to have_content "London"
      expect(page).to have_content "Hi I'm Barney"
    end
  end

  context 'with a picture' do

    before do 
      @user = User.new(   email: "barnany@barnany.com", 
                          password: "123456789", 
                          name_first: "Barnany", 
                          name_last: "Shute", 
                          job_title: "Freelance film maker", 
                          town: "London", 
                          bio: "Hi I'm Barney")
      @user.avatar = File.open('spec/fixtures/images/avatar.jpg')
      @user.save!
    end

    it "should allow user to have an avatar for their summary" do
      visit '/'
      expect(page).to have_css('.avatar-image')
      expect(@user.avatar_file_name).to eq "avatar.jpg"
      # expect(page).to have_content('avatar.jpg')
    end
  end
end
