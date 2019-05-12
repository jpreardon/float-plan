# Worklog

## TODO

- Fleet Pages
- Restrict adding/destroying users to admins
- Restrict views to users
- Restrict views to admins
- Email new users login token
- Wire up new float plan view
- Wire up float plan list view
- "Remember me" from more than one browser
- Allow users to edit their own profiles
- [Friendly forwarding](https://www.railstutorial.org/book/updating_and_deleting_users#sec-friendly_forwarding)

## 2019-05-12

- Refactor users list
- Add user destroy function

## 2019-05-11

- Continue with [auth](https://www.railstutorial.org/book/updating_and_deleting_users#sec-authorization)
  - Add logged in user authorization on edits
  - Hide crew listing from non-admins
  - Restrict user create, edit, update to admins
- Wire up crew view
  - Add users index page, remove static crew page, redirect navigation, test
  - Add table to crew page
  - Add Faker gem, seed database
  - Add pagination to crew page
  - Add new/edit/delete user buttons
  - Order user list by last name
  
## 2019-05-10

- Fix two subtle bugs in remember functions
- Add remember checkbox
- Finish login and remember me functions

## 2019-05-07

- Started working on auth, but went down a rathole because I didn't do the advanced login stuff, like an idiot. So I got (almost) nothing done.
- [Advanced Login](https://www.railstutorial.org/book/advanced_login) for cookies
  -  Add remember digest and remember function to user.
  -  Add remember function, and NEVER FORGET!!!
  -  Add forget functions.

## 2019-05-05

- User setup (a la [railstutorial](https://www.railstutorial.org/book/modeling_users))
  - Add new user form
  - Save new users to DB
- Change routes to remove "static pages" URLS
- Login
  - Add sessions controller
  - Add login page
  - Add session helpers for login
  - Add logout function
- Professional grade deployment [tutorial](https://www.railstutorial.org/book/sign_up#sec-professional_grade_deployment)
  - SSL
  - Webserver
  - DB
- Update users
  - Add users edit form
  - Add user edit function and tests

## 2019-05-04

- User setup (a la [railstutorial](https://www.railstutorial.org/book/modeling_users))
  - Add secure password function
  - Add and style debug info on pages in the dev environment
  - Add admin, skipper, and mobile to users

## 2019-05-03
- User setup (a la [railstutorial](https://www.railstutorial.org/book/modeling_users))
  - Add user basic model, validations & tests
- Test coverage for static pages

## 2019-05-01

- Add page titles
- Wireframe a float plan entry screen (mobile first)

## 2019-04-30

- Add app_name helper
- Custom guard file (from [railstutorial](https://bitbucket.org/railstutorial/sample_app_4th_ed/raw/289fcb83f1cd72b51c05fe9319277d590d51f0d2/Guardfile_))  
- "Wireframe" the app basics as static pages:
  - Float plans
  - Fleet
  - Crew

## 2019-04-29

- Set up Bootstrap
    - Add `gem 'bootstrap', '4.3.1'` to gemfile, `bundle install`
    - Followed directions from the README to import bootstrap and at jquery to gemfile
- Make app name dynamic (in nav)
- Make a (slightly) better home page. Well, one with more junk on it.
- Placeholders for basic IA


## 2019-04-28

- Unable to connect to Cloud9 Environment today after many attempts :( Let's just do this again...
  - Cloned repository with HTTPS this time
  - `printf "install: --no-rdoc --no-ri\nupdate:  --no-rdoc --no-ri\n" >> ~/.gemrc`
  - `gem install rails` (installed latest, 5.2.3)
  - `bundle install --without production`
  - `source <(curl -sL https://cdn.learnenough.com/heroku_install)` *had to do this twice*
  - `heroku login -i`
  - Added heroku remote `git remote add heroku https://git.heroku.com/float-plan-app.git`
  - Deployed to heroku, nice.
  - Decided to use [SSH for github](https://help.github.com/en/articles/connecting-to-github-with-ssh)
  - To test, shut down instance, browser, logged in again. It's working.

## 2019-04-27

- [Initialize git](https://www.atlassian.com/git/tutorials/setting-up-a-repository) 
- [Created a SSH Key and added it to github](https://help.github.com/en/articles/connecting-to-github-with-ssh)
- Set up new IDE on Cloud9
- Create new Rails app (using the the [Rails Tutorial](https://www.railstutorial.org/book/beginning) as a guide)
  - `printf "install: --no-rdoc --no-ri\nupdate:  --no-rdoc --no-ri\n" >> ~/.gemrc`
  - `gem install rails` (installed latest, 5.2.3)
  - Moved sqlite to development/test group in gemfile
  - Added a production group in gemfile, included postgres gem
  - Updated gemfile w/o installing pg locally: `bundle install --without production`
  - Installed heroku: `source <(curl -sL https://cdn.learnenough.com/heroku_install)`
  - Heroku login from command line: `heroku login -i`
  - Test deployment with hello world
- Created a static pages controller
- Added minitest reporters to gem file
