# README

## Rails App

1.	What is the need (i.e. challenge) that you will be addressing in your project?
The project of which we are working on is that of private property rental to campers, this website allows property owners to list and rent out their property/backyard, as well as allows campers to book and camp at these private locations.  

This allows campers to stay at private, reclusive spots instead of being restricted to overcrowded public campsites.
----------------------------------------------------------------------------------------------------------------------------
2.	 Identify the problem you’re trying to solve by building this particular marketplace App?

As detailed above, this app allows campers to book and stay at private, more intimate locations, instead of overcrowded public campsites and caravan parks.     

This provides a more safe, controlled environment with more private facilities, lower risk of theft, not being surrounded by strangers, more privacy and the uniqueness of whichever property/backyard you happen to be staying at.    

OutBack provides a cheaper alternative to the Caravan-Park-Monopolized campsites, and a cheap replacement to the free, overcrowded campsites.  
----------------------------------------------------------------------------------------------------------------------------
3.	Why is it a problem that needs solving?

This is a problem that needs solving due to the cons of public campsites, overcrowded national parks, overpriced caravan parks (these are not public, however account for a majority of the camp market, this app would provide a cheaper, more intimate/private alternative.)

----------------------------------------------------------------------------------------------------------------------------

4.	Describe the project will you be conducting and how. your App will address the needs.

The App of which we are working on will address the need by enabling a user to rent their private property/land space to campers on a platform where campers can then rent these places,   providing a source of income for the landowners whom have listed this property, and providing a safe,  private and enjoyable campsite for the camper.  
----------------------------------------------------------------------------------------------------------------------------
5.	Describe the network infrastructure the App may be based on.
#
The network infrastructure this app is based on is that of Heroku, this is natively compatible with the database of choice, and rails itself, and is the obvious choice for this project.  
----------------------------------------------------------------------------------------------------------------------------
6.	Identify and describe the software to be used in your App.
#
HTML(ERB) - this is html with embedded ruby, this allows a combination of the standard website creating language and that of Ruby.  
#
CSS(SCSS) - Allows styling of the above HTML pages.  
#
Bootstrap - Bootstrap allows convenient templates/styling for website components. 
#
Ruby - Common programming language.  
#
Ruby on rails - Common website app framework of which includes everything needed to assemble a web application, runs on   Model, View and Controller system.  (integrates Ruby Language)
#
GitHub - allows all members of the team to contribute and work simultaneously on the project, providing a tool to merge work, save, manage and rollback to prior versions of the project if needed.  
#
Heroku - Heroku is a platform as a service (PaaS) that enables developers to build, run, and operate applications entirely in the cloud.    
#
Stripe - A standard payment system, of which was integrated into the website, allows the users to pay for the booking of campsites.  
#
Devise - Devise is a flexible authentication solution for Rails based on Warden
https://github.com/plataformatec/devise
#
Simple calendar(gem) - Allowed us to integrate a calendar booking system to the website, easing user experience.  
#
AWS S3 - Amazon Web Services offers reliable, scalable, and inexpensive cloud computing services.
#

#
PostgreSQL - PostgreSQL is an object-relational database management system.
----------------------------------------------------------------------------------------------------------------------------
7.	Identify the database to be used in your App and provide a justification for your choice.
#
PostgreSQL is the database we chose to use, given its convenient native compatibility with Heroku and ability to cover all functions of which we required at initial planning stages.  
----------------------------------------------------------------------------------------------------------------------------
8.	Identify and describe the production database setup (i.e. postgres instance).
#
PostgreSQL as detailed above, was the production database of which we used, this 

PostgreSQL is a powerful, open source object-relational database system that uses and extends the SQL language combined with many features that safely store and scale the most complicated data workloads. PostgreSQL works natively with Heroku.
----------------------------------------------------------------------------------------------------------------------------
9.	Describe the architecture of your App.
#
Given the project is using Ruby on Rails, we have used the standard and implemented MVC system, this standing for Model, View and Controller and supplies everything needed to design a website. 

Breakdown is as follows:

Model - This is the part of the system that manages the database, here contains the relationships (has and belongs to) that works as the structure for data and defines and sets the structure for how the data will be held.  (detail as to the data relationships defined in further detail below.)  


View - as per the name, this is for the view, which means page layout through the html.erb files of which link to the CSS stylesheets, this is where all the design skills (or perhaps lack of, should you not be phased by our attempt) come into play.   


Controller - This part of the system contains the processes, methods and functionality of data inputted and outputted, more or less if data is being changed, found, or shown, the code that makes that happen is shown here. 
----------------------------------------------------------------------------------------------------------------------------
10.	Explain the different high-level components (abstractions) in your App.
#
Active Record is the abstraction used, as it's simplistic and basic usability allows us utilize its features without such an advanced technical knowledge.   
Using Active record, we can abstract data from key models/objects table using a simple, understandable and not too complex code.  
----------------------------------------------------------------------------------------------------------------------------
11.	Detail any third-party services that your App will use.
#
A multitude of Gems installed, (gemfile attached)
#
Stripe - A standard payment system, of which was integrated into the website, allows the users to pay for the booking of campsites. 
#
Devise - Devise is a flexible authentication solution for Rails based on Warden
https://github.com/plataformatec/devise
#
Heroku - Heroku is a platform as a service (PaaS) that enables developers to build, run, and operate applications entirely in the cloud.    
#
AWS S3 - Amazon Web Services offers reliable, scalable, and inexpensive cloud computing services.
#
----------------------------------------------------------------------------------------------------------------------------
12.	Describe (in general terms) the data structure of marketplace apps that are similar to your own (e.g. eBay, Airbnb).
#
There is no shortage of rental property websites, and we did use many for inspiration for design and function too (the interactive booking calendar was a really big thing we wanted to accomplish.)   In terms of two-sided marketplace websites, there again is infinite amount of options.  

We took alot of influence from Airbnb, a website called Wiki camps, and found an identical competitor by the name of YouCamp, (I never got around to asking what language YouCamp is written in.)

Youcamps is almost identical in data structure, users can list property as well as book private properties.   

Links:
https://www.airbnb.com.au/
https://www.wikicamps.com.au/
https://youcamp.com/

----------------------------------------------------------------------------------------------------------------------------
13.	Discuss the database relations to be implemented.
# 
The database relations of which are to be implemented are broken down into three, (further details in below question.) 

We want a user to be about to create a listing, as well as also being able to book a listing, we feel having two different types/tables in the database dedicated to different types of users isn't very user friendly and overcomplicates things far too much.   
This way, user can have many bookings, and can have many listings.  
#
We want listings to be created to belong to the user who created it, as well can have many bookings, as many people will be booking a listing for different times.  
#
We also want a booking to belong to a listing, as well as belong to the user who has made the booking.    
This way, a booking belongs to a listing, but also belongs to the user who created it.  
----------------------------------------------------------------------------------------------------------------------------
14.	Describe your project’s models in terms of the relationships (active record associations) they have with each other.
#
As visualized in the below Database design, three classes exist, that of Users, Listings and Bookings.  
Details onto exactly what each model consists of in the DB can be found in the updated DB schema attached.  

Breakdown is as follows

 Bookings has the following relationship attributes:
  belongs to: user
  belongs to: listing

summary:
bookings belong to the user whom booked it through a "booking user id”, however are connected to the host through listings "user id." 

#

Class Listing has the following relationship attributes:
  has_many_attached :uploaded_images, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :users,  through: :bookings

  summary:  
  Listings are created by a user,  and is connected to this user by a foreign key of which is easily named User ID.   
  On completion of the listing being created. (has many bookings via foreign key) (initially a Boolean titled "Booked_status”, but later changed to a dates/integer system integrated with simple calendar gem.)   
  
Dependent destroy means if the listing is deleted, as is their bookings, and attached images.  

#
class User has the following relationship attributes:
  has_many: bookings, dependent: destroy
  has_many: listings, dependent: destroy

  summary:
  User is both the host/creator of the listing/backyard, as well as the one to create bookings of said listings/backyards.   Dependent destroy means if the user is deleted, as is their bookings, and listings.
----------------------------------------------------------------------------------------------------------------------------
15.	Provide your database schema design.
----------------------------------------------------------------------------------------------------------------------------
Provide User stories for your App.
#
Aaroff Womendonsa has a beautiful backyard in the rural outback of Glen Huntly, given his hunger for meaningful social connection and desperate need to be thanked, he discovers OutBack, a webapp devoted to providing campers with a unique private backyard camping experience.  He immediately lists his backyard as a campsite with a reasonable price, and before long has a long booklist of a large variety of campers travelling through the area.

It doesn't take him long to realise that all the years of toiling away, creating code and web-based client solutions has been for naught for, truly, it is the relationships with others that truly makes Aaron Womandonsa's heart sing. Aaron is overwhelmed with joy at the opportunity to meet so many warm, interesting people who sleep in a tent in his backyard. For it is not money that ignites the human spirit but, rather, the connections we form with others: our friendships, our relationships. Working together through the happy times and the sad. Coming together as a community to deify the things that are truly important. At long last, Aaron is finally happy. And this happiness's name is OutBack.  

Although the extra money goes towards lunch beers.  
#
Harridaughter Mtogether is an avid camper,  who after a long stretch of overcrowded and overpriced campsites,  often of which have been victim to intense littering,  overpopulation and general lack of care -  feels burnt out from the traditional campsite,  and an inability to share his knowledge and Sandringham-line lifestyle with the cold,  constantly rotating strangers of whom he shares these campsites.   It is here where his disillusion to the hobby is reinvigorated, having discovered a new App called OutBack, where one can book a private backyard/patch of land on somebodies’ property. 

Harridaughter is ecstatic to have discovered such an intimate experience, with close interaction with hosts whom impart wisdom, and allow Harrisdaughter to impart wisdom and knowledge right on back.   The price is a small thing to pay, when at the end of each stay, he receives a stern, and priceless "thank you."  His love for camping is now stronger than ever.  
----------------------------------------------------------------------------------------------------------------------------
16.	Provide Wireframes for your App.
----------------------------------------------------------------------------------------------------------------------------
17.	Describe the way tasks are allocated and tracked in your project.
# 
We used Trello, of which allowed us to assume a basic to do list, with priorities and task assignment.    
# 
Vocally we set a few major vague deadlines, such as "complete backend by Thursday week 1” of which were more competitive goals than strict deadlines.  
#
On top of this there was constant communication, we would revisit and check up on progress every few hours and maintain an open dialogue.  
#
This as well as the daily check-ups ensured we were on top of progress.  
#
link to trello:
https://trello.com/b/yVevhSSY/rails-app
----------------------------------------------------------------------------------------------------------------------------
18.	Discuss how Agile methodology is being implemented in your project.
#
The Agile Methodology has been implemented as much as it could have been for such a small scale,  short timed project,   morning stand-ups were conducted,  and vague sprints were conducted dedicated to aspects of the projects,  (for example,  backend being completed by Thursday of first week, and front end being finished by Wednesday of second week.)  This was a vocally set goal of which was discussed during stand-up, and suffered a few hiccups along the way, which I suppose is the reason Agile is implemented, to embrace and account for unpredictability with a project such as this. 
----------------------------------------------------------------------------------------------------------------------------
19.	Provide an overview and description of your Source control process.
#
We used GitHub of which,  as mentioned below,  allowed us to work independently after the foundations were setup (for this we peer programmed for the first to second day,)   after this it was the standard GitHub technique  "test on branch,  ensure it works and then commit/merge with master after reviewing the request together."  at the end we ended up with over 20 branches and over 130 commits, none have been deleted as to show the functions worked on and when they were completed.    
----------------------------------------------------------------------------------------------------------------------------
20.	Provide an overview and description of your Testing process.
#
We would regularly be testing with features while they were being created, as well as rigorous physical testing upon deployment to Heroku as we realized sometimes things would screw up and not appear or function as they did in localhost. 

The standard "test on branch,  ensure it works and then commit/merge with master after reviewing the request together" was the king of this project,  and if something in Master/Origin was broken,  Add it immediately to the "Bugs" section on trello,  and fix it immediately so we don't lose track of bugs/further break things.
----------------------------------------------------------------------------------------------------------------------------
21.	Discuss and analyse requirements related to information system security.
#
I flicked through this and found regulations on a multitude of user data handling and storage.  
https://www.oaic.gov.au/privacy-law/privacy-act/

Privacy is a big deal, and ensuring everything is secure and safe from others is paramount to comply with up to date regulations.  
----------------------------------------------------------------------------------------------------------------------------
22.	Discuss methods you will use to protect information and data.
#
We used CanCan, which was more or less a very easy and functional permissions addon.  This stopped users from accessing and deleting things they shouldn't be able to.   I think there were a few if statements chucked in to compare user ID to that of listing or bookings, but CanCan is king to protect link manipulation. 
----------------------------------------------------------------------------------------------------------------------------
23.	Research what your legal obligations are in relation to handling user data.

I flicked through this and found regulations on a multitude of user data handling and storage.  
https://www.oaic.gov.au/privacy-law/privacy-act/

Privacy is a big deal, and ensuring everything is secure and safe from unauthorized viewers is paramount to comply with up to date regulations.
