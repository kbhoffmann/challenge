# README

### Take home challenge with deleting, allow deletion comments and undeletion of inventory items.

#### Project stats:
 ![languages](https://img.shields.io/github/languages/top/kbhoffmann/challenge?color=red)
 ![closed PRs](https://img.shields.io/github/issues-pr-closed/kbhoffmann/challenge?style=flat-square)   

#### Created using:
 ![RoR](https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white)
 ![pgsql](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)
 ![heroku](https://img.shields.io/badge/Heroku-430098?style=for-the-badge&logo=heroku&logoColor=white)
  - Ruby 2.7.2  
  - Rails 5.2.6 

#### Tested using:
 ![rspec](https://img.shields.io/gem/v/rspec-rails?label=rspec&style=flat-square)
 ![shoulda](https://img.shields.io/gem/v/shoulda-matchers?label=shoulda-matchers&style=flat-square)
 ![capybara](https://img.shields.io/gem/v/capybara?label=capybara&style=flat-square)
 ![simplecov](https://img.shields.io/gem/v/simplecov?label=simplecov&style=flat-square)

#### Run on your own computer:
- Clone project into your local machine
- cd into the 'challenge' directory
- Run 'bundle' in your terminal to install dependencies
- Run 'rails db:{create,migrate,seed}' in your terminal to initialize database
- Run test suite by running 'bundle exec rspec' in your terminal
- Open testing coverage details by entering 'open coverage/index.html' in your terminal.
- Run 'rails s' in your terminal and open up localhost:3000 in your browser web address bar.

→ [Try it out here in production on Heroku](https://frozen-retreat-63317.herokuapp.com/)  

### Database tables and their relationships for user story regarding deleting an item
(Note: other tables exist in the database schema that would be used for other user stories)

<img width="753" alt="Screen Shot 2022-05-17 at 14 57 48" src="https://user-images.githubusercontent.com/84674761/168909255-011d6d8e-57f0-46ac-87ed-01e663355f60.png">
