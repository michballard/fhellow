# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


barnany = User.create(email: "barnany@barnany.com", 
						password: "123456789", 
						name_first: "Barnany", 
						name_last: "Shute", 
						job_title: "Freelance film maker", 
						location: "London", 
						bio: "Hi I'm Barney")

juan = User.create(email: "Juan@juan.com", 
						password: "123456789", 
						name_first: "Juan", 
						name_last: "Manuel", 
						job_title: "Freelance Journalist, author and entrepreneur", 
						location: "London", 
						bio: "")

jake = User.create(email: "Jake@Jake.com", 
						password: "123456789", 
						name_first: "Jake", 
						name_last: "Sanderson", 
						job_title: "Freelance Journalist", 
						location: "London", 
						bio: "")

paul = User.create(email: "Paul@paul.com", 
						password: "123456789", 
						name_first: "Paul", 
						name_last: "Spencer", 
						job_title: "Tech Entrepreneur", 
						location: "London", 
						bio: "")

emanuel = User.create(email: "Emanuel@emanuel.com", 
						password: "123456789", 
						name_first: "Emanuel", 
						name_last: "Van De Hamiltonson", 
						job_title: "Freelance Broadcaster", 
						location: "London", 
						bio: "")

samantha = User.create(email: "Samantha@sam.com", 
						password: "123456789", 
						name_first: "Samantha", 
						name_last: "Hilby", 
						job_title: "Freelance Designer", 
						location: "London", 
						bio: "")

ant = User.create(email: "ant@ant.com", 
						password: "123456789", 
						name_first: "Anthony", 
						name_last: "Ward Katavonichairna", 
						job_title: "Serial Entrepreneur and freelance designer", 
						location: "London", 
						bio: "")

jon = User.create(email: "jon@jon.com", 
						password: "123456789", 
						name_first: "Jon", 
						name_last: "Jackson", 
						job_title: "Freelance Designer", 
						location: "London", 
						bio: "")

john = User.create(email: "jonathe@jonathe.com", 
						password: "123456789", 
						name_first: "Jon", 
						name_last: "Jackson", 
						job_title: "Freelance Designer", 
						location: "London", 
						bio: "")

gemma = User.create(email: "Gemma@gemma.com", 
						password: "123456789", 
						name_first: "Gemma", 
						name_last: "Gaven", 
						job_title: "Freelance PR", 
						location: "London", 
						bio: "")