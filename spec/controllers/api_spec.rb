require 'rails_helper'
    
describe ApiController do

    context 'JSON' do 
      before do 
        @user = User.new( email: "barnany@barnany.com", 
                            password: "123456789", 
                            name_first: "Barnany", 
                            name_last: "Shute", 
                            job_title: "Freelance film maker", 
                            location: "London", 
                            bio: "Hi I'm Barney")
        @user.avatar = File.open('spec/fixtures/images/avatar.jpg')
        @user.save!
      end

      describe "GET 'index" do 
        it "returns a successful 200 reponse" do 
          get :getuser, format: :json 
          expect(response).to be_success
        end
      end






  end
end