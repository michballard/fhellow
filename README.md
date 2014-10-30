![Fhellow](https://www.evernote.com/shard/s31/sh/78148be7-ab59-4509-b16e-e865d54dc19d/b76d6f3da1e974563d374f5d916e26b4/deep/0/Fhellow.png)

The Idea
----
[Fhellow](fhellow.heroku.com) is the brain child of Alisa Afkhami, a freelance designer. Alisa found, like many freelancers eventually do, that whilst being a freelancer has many benefits it can also be a lonely profession. Freelancers are unable to tap into a professional network for contacts, benefits and social discourse, until now. Fhellow is a social networking site for freelance professionals. A place to connect and chat with Fhellow freelancers and build a professional network without an office. 

The Team
----
#####Development:

[Ruth Earle](https://github.com/ruthearle)

[Michelle Ballard](https://github.com/michballard)

[Maya Driver](https://github.com/mayadriver)

[Jerome Pratt](https://github.com/jjromeo)


#####Design:

Alisa Afkami

What we learned
-----
> *Ruth...*

>I think one of the most valuable learning experiences we will all take
>away is working with a client with real expectations. Alisa had a very
>clear idea of the apps purpose which made the process of planning and
>execution fairly straight forward. We followed mock-ups of the website
>and they were great for the frontend development of the web app.
 
 
> *Michelle...*

>It was a great experience creating the Fhellow website for our final Makers Academy project.  In particular I learned a lot about practising agile techniques and the benefits gained from working in an agile environment.  

>The techniques we used during the two week project sprint were: 

> - Stand up meetings every morning
> - Product demo’s every evening
> - Listing tasks on a kanban board (using Trello) and tracking the progress of each task
> - Pair programming with regular rotations so that every team members understood all parts of the project

>From early in the project it became evident how much agile principles were contributing to the project’s success.  We were able to quickly pick up new tasks once current tasks were completed, understand what team members were working on and we could easily be responsive to project changes. Working in an agile manner is something I will definitely continue practising in the future.  


Technologies used
----

#####Built with:

- Ruby on Rails 4
- PostgreSQL
- HTML
- CSS3
- JavaScript
- JQuery
- Mustache.js
- Devise
- Paperclip
- Omniauth
- GMaps.js
- Geocoder
- (Bootstrap)
- Amazon AWS S3

######Test-driven with:

- RSpec-Rails 
- Capybara
- Jasmine 

######Deployed with:
- Heroku
- Heroku secrets


How to run the app
----

Before running the app you will need to set your own secret keys in
`config/secrets.yml`, as follows:

```
secret_key_base: *****
facebook_secret: *****
AWSAccessKeyId: *****
AWSSecretKey: *****
```

After cloning the repository `cd` into the freshly cloned directory and run `bin/rails s`, then open your browser of choice and in the address bar, type `localhost:3000`.
