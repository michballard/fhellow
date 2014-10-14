# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all


barnany = User.new(email: "barnany@barnany.com",
						password: "123456789",
						name_first: "Barnany",
						name_last: "Shute",
						job_title: "Freelance film maker",
						location: "London",
						bio: "Hi I'm Barney",
 					  latitude: 51.525803,
 					  longitude: -0.088277)
barnany.avatar = File.open('spec/fixtures/images/avatar.jpg')
barnany.save!

juan = User.new(email: "Juan@juan.com",
						password: "123456789",
						name_first: "Juan",
						name_last: "Manuel",
						job_title: "Freelance Journalist, author and entrepreneur",
						location: "London",
						bio: "",
					    latitude: "",
					    longitude: "")
juan.avatar = File.open('spec/fixtures/images/avatar.jpg')
juan.save!

jake = User.new(email: "Jake@Jake.com",
						password: "123456789",
						name_first: "Jake",
						name_last: "Sanderson",
						job_title: "Freelance Journalist",
						location: "London",
						bio: "",
					  latitude: "",
					  longitude: "" )
jake.avatar = File.open('spec/fixtures/images/avatar.jpg')
jake.save!

paul = User.new(email: "Paul@paul.com",
						password: "123456789",
						name_first: "Paul",
						name_last: "Spencer",
						job_title: "Tech Entrepreneur",
						location: "London",
						bio: "",
					  latitude: "" ,
					  longitude: "" )
paul.avatar = File.open('spec/fixtures/images/avatar.jpg')
paul.save!

emanuel = User.new(email: "Emanuel@emanuel.com",
						password: "123456789",
						name_first: "Emanuel",
						name_last: "Van De Hamiltonson",
						job_title: "Freelance Broadcaster",
						location: "London",
						bio: "",
					  latitude: "" ,
					  longitude: "" )
emanuel.avatar = File.open('spec/fixtures/images/avatar.jpg')
emanuel.save!

samantha = User.new(email: "Samantha@sam.com",
						password: "123456789",
						name_first: "Samantha",
						name_last: "Hilby",
						job_title: "Freelance Designer",
						location: "London",
						bio: "",
					  latitude: "" ,
					  longitude: "" )
samantha.avatar = File.open('spec/fixtures/images/avatar.jpg')
samantha.save!

ant = User.new(email: "ant@ant.com",
						password: "123456789",
						name_first: "Anthony",
						name_last: "Ward Katavonichairna",
						job_title: "Serial Entrepreneur and freelance designer",
						location: "London",
						bio: "",
					  latitude: "" ,
					  longitude: "" )
ant.avatar = File.open('spec/fixtures/images/avatar.jpg')
ant.save!

jon = User.new(email: "jon@jon.com",
						password: "123456789",
						name_first: "Jon",
						name_last: "Jackson",
						job_title: "Freelance Designer",
						location: "London",
						bio: "",
					  latitude: "" ,
					  longitude: "" )
jon.avatar = File.open('spec/fixtures/images/avatar.jpg')
jon.save!

john = User.new(email: "jonathe@jonathe.com",
						password: "123456789",
						name_first: "Jon",
						name_last: "Jackson",
						job_title: "Freelance Designer",
						location: "London",
						bio: "",
					  latitude: "" ,
					  longitude: "" )
john.avatar = File.open('spec/fixtures/images/avatar.jpg')
john.save!

gemma = User.new(email: "Gemma@gemma.com",
						password: "123456789",
						name_first: "Gemma",
						name_last: "Gaven",
						job_title: "Freelance PR",
						location: "London",
						bio: "",
					  latitude: "" ,
					  longitude: "" )
gemma.avatar = File.open('spec/fixtures/images/avatar.jpg')
gemma.save!

