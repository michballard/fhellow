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

	def create_barnany
	    User.create(email: "barnany@barnany.com",
	                password: "123456789",
					name_first: "Barnany",
					name_last: "Shute",
					job_title: "Freelance film maker",
					town: "London",
					bio: "Hi I'm Barney",
					latitude: 51.522783,
					longitude: -0.082867,
					discussing_ideas: true, 
					afterwork_drinks: true, 
					collaborating: true, 
					chat_over_a_coffee: true, 
					lunch_buddy: true, 
					advising: true)
	end

	def create_gemma
		User.create(id: 10, email: "Gemma@gemma.com",
							password: "123456789",
							name_first: "Gemma",
							name_last: "Gaven",
							job_title: "Freelance PR",
							location: "London",
							bio: "",
							latitude: 51.529363,
							longitude: -0.085927,
							discussing_ideas: false, 
							afterwork_drinks: false, 
							collaborating: false, 
							chat_over_a_coffee: false, 
							lunch_buddy: false, 
							advising: false)
	end

end 