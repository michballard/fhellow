# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create(email: "barnany@barnany.com", 
						password: "123456789", 
						name_first: "Barnany", 
						name_last: "Shute", 
						job_title: "Freelance film maker", 
						location: "London", 
						bio: "Hi I'm Barney")

User.create(email: "", 
						password: "", 
						name_first: "", 
						name_last: "", 
						job_title: "", 
						location: "", 
						bio: "")

User.create(email: "", 
						password: "", 
						name_first: "", 
						name_last: "", 
						job_title: "", 
						location: "", 
						bio: "")