# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Post.destroy_all


barnany = User.new(id: 1, email: "barnany@barnany.com",
            password: "123456789",
            name_first: "Barnany",
            name_last: "Shute",
            job_title: "Freelance film maker",
            location: "London",
            bio: "Hi I'm Barney",
            town: "London",
            latitude: 51.521803,
            longitude: -0.081277,
                      discussing_ideas: true, 
                      afterwork_drinks: false, 
                      collaborating: false, 
                      chat_over_a_coffee: false, 
                      lunch_buddy: false, 
                      advising: false)
barnany.avatar = File.open('spec/fixtures/images/profile_pics/User_1.jpg')
barnany.save!

juan = User.new(id: 2, email: "Juan@juan.com",
            password: "123456789",
            name_first: "Juan",
            name_last: "Manuel",
            job_title: "Freelance Journalist, author and entrepreneur",
            location: "London",
            bio: "This is my bio(juan)",
            town: "London",
            latitude: 51.512803,
            longitude: -0.082287,
                      discussing_ideas: false, 
                      afterwork_drinks: true, 
                      collaborating: false, 
                      chat_over_a_coffee: false, 
                      lunch_buddy: false, 
                      advising: false)
juan.avatar = File.open('spec/fixtures/images/profile_pics/User_2.jpg')
juan.save!

jake = User.new(id: 3, email: "Jake@Jake.com",
            password: "123456789",
            name_first: "Jake",
            name_last: "Sanderson",
            job_title: "Freelance Journalist",
            location: "London",
            bio: "This is my bio(jake)",
            town: "London",
            latitude: 51.533803,
            longitude: -0.083297,
                      discussing_ideas: false, 
                      afterwork_drinks: false, 
                      collaborating: true, 
                      chat_over_a_coffee: false, 
                      lunch_buddy: false, 
                      advising: false)
jake.avatar = File.open('spec/fixtures/images/profile_pics/User_3.jpg')
jake.save!

paul = User.new(id: 4, email: "Paul@paul.com",
            password: "123456789",
            name_first: "Paul",
            name_last: "Spencer",
            job_title: "Tech Entrepreneur",
            location: "London",
            bio: "This is my bio(paul)",
            town: "London",
            latitude: 51.515303,
            longitude: -0.084827,
                      discussing_ideas: false, 
                      afterwork_drinks: false, 
                      collaborating: false, 
                      chat_over_a_coffee: false, 
                      lunch_buddy: false, 
                      advising: false)
paul.avatar = File.open('spec/fixtures/images/profile_pics/User_4.jpg')
paul.save!

emanuel = User.new(id: 5, email: "Emanuel@emanuel.com",
            password: "123456789",
            name_first: "Emanuel",
            name_last: "Van De Hamiltonson",
            job_title: "Freelance Broadcaster",
            location: "London",
            bio: "This is my bio(emanuel)",
            town: "London",
            latitude: 51.512003,
            longitude: -0.083857,
                      discussing_ideas: false, 
                      afterwork_drinks: false, 
                      collaborating: false, 
                      chat_over_a_coffee: false, 
                      lunch_buddy: true, 
                      advising: false)
emanuel.avatar = File.open('spec/fixtures/images/profile_pics/User_5.jpg')
emanuel.save!

samantha = User.new(id: 6, email: "Samantha@sam.com",
            password: "123456789",
            name_first: "Samantha",
            name_last: "Hilby",
            job_title: "Freelance Designer",
            location: "London",
            bio: "This is my bio(samantha)",
            town: "London",
            latitude: 51.579303,
            longitude: -0.083677,
                      discussing_ideas: false, 
                      afterwork_drinks: false, 
                      collaborating: false, 
                      chat_over_a_coffee: false, 
                      lunch_buddy: false, 
                      advising: true)
samantha.avatar = File.open('spec/fixtures/images/profile_pics/User_6.jpg')
samantha.save!

ant = User.new(id: 7, email: "ant@ant.com",
            password: "123456789",
            name_first: "Anthony",
            name_last: "Ward Katavonichairna",
            job_title: "Serial Entrepreneur and freelance designer",
            location: "London",
            bio: "This is my bio(ant)",
            town: "London",
            latitude: 51.523563,
            longitude: -0.087277,
                      discussing_ideas: true, 
                      afterwork_drinks: true, 
                      collaborating: false, 
                      chat_over_a_coffee: false, 
                      lunch_buddy: false, 
                      advising: false)
ant.avatar = File.open('spec/fixtures/images/profile_pics/User_7.jpg')
ant.save!

jon = User.new(id: 8, email: "jon@jon.com",
            password: "123456789",
            name_first: "Jon",
            name_last: "Jackson",
            job_title: "Freelance Designer",
            location: "London",
            bio: "This is my bio(jon)",
            town: "London",
            latitude: 51.523783,
            longitude: -0.088277,
                      discussing_ideas: false, 
                      afterwork_drinks: false, 
                      collaborating: true, 
                      chat_over_a_coffee: false, 
                      lunch_buddy: false, 
                      advising: false)
jon.avatar = File.open('spec/fixtures/images/profile_pics/User_8.jpg')
jon.save!

john = User.new(id: 9, email: "jonathe@jonathe.com",
            password: "123456789",
            name_first: "Jonathon",
            name_last: "Jackson",
            job_title: "Freelance Designer",
            location: "London",
            bio: "This is my bio(jonathon)",
            town: "London",
            latitude: 51.522783,
            longitude: -0.082867,
                      discussing_ideas: true, 
                      afterwork_drinks: true, 
                      collaborating: true, 
                      chat_over_a_coffee: false, 
                      lunch_buddy: true, 
                      advising: true)
john.avatar = File.open('spec/fixtures/images/profile_pics/User_9.jpg')
john.save!

gemma = User.new(id: 10, email: "Gemma@gemma.com",
            password: "123456789",
            name_first: "Gemma",
            name_last: "Gaven",
            job_title: "Freelance PR",
            location: "London",
            bio: "This is my bio(gemma)",
            town: "London",
            latitude: 51.529363,
            longitude: -0.085927,
                      discussing_ideas: false, 
                      afterwork_drinks: false, 
                      collaborating: false, 
                      chat_over_a_coffee: false, 
                      lunch_buddy: false, 
                      advising: false)
gemma.avatar = File.open('spec/fixtures/images/profile_pics/User_10.jpg')
gemma.save!



message_1 = Post.new(content: "Consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore
                     magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.
                     Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor
                     sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna
                     aliquyam erat, sed diam voluptua.",
                     user_id: 1)

message_1.image = File.open('spec/fixtures/images/post_pics/post_1.jpg')
message_1.save!

message_2 = Post.new(content: "Consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore
                     magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.
                     Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor
                     sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna
                     aliquyam erat, sed diam voluptua.",
                     user_id: 2)
message_2.image = File.open('spec/fixtures/images/post_pics/post_2.jpg')
message_2.save!

message_3 = Post.new(content: "Consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore
                     magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.
                     Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor
                     sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna
                     aliquyam erat, sed diam voluptua.",
                     user_id: 3)
message_3.image = File.open('spec/fixtures/images/post_pics/post_3.jpg')
message_3.save!


message_4 = Post.new(content: "Consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore
                     magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.
                     Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor
                     sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna
                     aliquyam erat, sed diam voluptua.",
                     user_id: 4)
message_4.image = File.open('spec/fixtures/images/post_pics/post_4.jpg')
message_4.save!


message_5 = Post.new(content: "Consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore
                     magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.
                     Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor
                     sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna
                     aliquyam erat, sed diam voluptua.",
                     user_id: 5)
message_5.image = File.open('spec/fixtures/images/post_pics/post_5.jpg')
message_5.save!

message_6 = Post.new(content: "Consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore
                     magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.
                     Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor
                     sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna
                     aliquyam erat, sed diam voluptua.",
                     user_id: 6)
message_6.image = File.open('spec/fixtures/images/post_pics/post_6.jpg')
message_6.save!



