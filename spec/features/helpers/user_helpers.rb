module SessionHelpers

	def user_sign_up
		visit '/users/sign_up'
		fill_in("Email", with: "barnany@barnany.com")
		fill_in("Password", with: "12345678")
		fill_in("Password confirmation", with: "12345678")
		click_button('Sign up') 
	end

end 