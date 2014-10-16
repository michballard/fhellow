module SessionHelpers

	def user_sign_up
		visit '/users/sign_up'
		fill_in("Email", with: "barnany@barnany.com")
		fill_in("Password", with: "12345678")
		fill_in("Password confirmation", with: "12345678")
		click_button('Sign up') 
	end

	def add_basic_details
    fill_in('user[name_first]', with: 'Barnany')
    fill_in('user[name_last]', with: 'Shute')
    fill_in('Email', with: 'barnany@barnany.com')
    fill_in('user[job_title]', with: 'Freelance film maker')
    fill_in('user[bio]', with: "Hi I'm Barney")
	end

  def add_bob_details
      fill_in('user[name_last]', with: 'Shute')
      fill_in('user[job_title]', with: 'Freelance film maker')
  end

end 