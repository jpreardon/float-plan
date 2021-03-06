# Worklog

## TODO

- Improve skipper float plan experience
- Make float plan checklist checkboxes complete checkout
- Move logged_in_user and admin_user functions to a helper? (they are duplicated now)
- Email new users login token [account activation tutorial](https://www.railstutorial.org/book/account_activation) might be helpful
- Better typeahead for mobile (adding crew) (chosen doesn't work at all)
- Create a better fleet view like the [original design](design/fleet-screen-mockup.png)
- Create a better float plan view like the [original design](design/float-plan-screen-mockup.png)
- "Remember me" from more than one browser
- Allow users to edit their own profiles
- [Friendly forwarding](https://www.railstutorial.org/book/updating_and_deleting_users#sec-friendly_forwarding)
- Better guest handling
- Improve float plan index page (don't always show inactive), there are some skipped test for this

## 2019-06-08

- Add last_activity_date to users

## 2019-06-02

- Add the checkin form fields to the plan edit form.
- Separate the edit form into partials for checkout and checkin.
- Add front-end logic to present only the checkout partial for new plans.
- Don't allow skippers to delete their float plans after they are complete
- Fill in more float plan related tests

## 2019-06-01

- Add a guest textbox to float plans, this is temporary.

Time to figure out how to separate checkouts and checkins. Float plans happen in two parts: Checkout and Checkin. The float plan should be editable to skippers until they complete the checkin (so they can add/remove crew etc.). When creating a new plan, we should only show the form fields needed for checkout. Once that is submitted, the edit form should show the first part of the form as read-only, and the second part as editable, with buttons to complete the check-in. The first part of the should be made editable behind an edit button or something.

- Clean up the show form, refactor into partials for the first and last part of the plan form.


## 2019-05-29

There are two many-to-many associations between users and plans. One for the skipper, and one for the crew. The plan has a skipper, and a crew collection. One the user side, plans refers to float plans one has created while trips refer to times that one has been crew. Originally, I had called both of those associations ":plans" in the user model, but that doesn't work very well. Yesterday, I changed the crew association to ":trips". I wanted to rename the join table and clean up any other mess left behind by the original, broken implementation--before I started really using the trips collection.

As I'm writing this, I'm thinking that I could consolodate into one plans or trips collection and have a skipper flag on the join table. Having a separate skipper_id foreign key makes it a little easier when rendering, I think. So, I'll leave it the way it is for now, but making the above naming changes allows for putting the skipper identifier in the crew/trip join table.

- Rename crew_plans table to crew_trips. Change foreign key names to match primary keys. Remove extra foreign key specs in models.
- Fill in skipped tests
  - Test: Ensure that admins can see the edit link on the plan show page. 
  - Test: Ensure some actions are restricted to skippers and admins on plans controller.
  - Test: Ensure that crew can be edited on a plan
  - Add messages to skipped tests.

## 2019-05-28

- Float plan tests
  - Test to make sure skippers can only edit and destroy their own plans. 
  - Tests for boat model.
  - Add test cases for plans (they are skipped for now)

## 2019-05-27

- Add associations for skippers
  - Add skipper association between plans and users.
  - Add skipper select to new/edit form, show on index and show.
  - Restrict skipper selection to skippers, order by last name
  - Remove skipper selection for non-admin users
  - Add skipper ID as hidden field when there is no skipper select
  - Style skipper field as readonly for skippers
- Allow skippers to edit their float plans (and only their float plans)
- Add associtations for crew/guests
  - Add crew association between plans and users. Display crew list on show form. 
  - Add a typeahead function to add crew. [This](https://stackoverflow.com/questions/34465104/autocomplete-many-to-many-rails-4), [this](https://github.com/tsechingho/chosen-rails), and [this](https://harvesthq.github.io/chosen/) were helpful.
  - Add number of crew to index page.

## 2019-05-26

- Make date/time fields more tolorable on the float plan form
  - Separated date and times, added formats and default values.
  - Move date and time formatting to a helper functions
  - Make sure date/time formatting helpers don't fail when giving nil
- Add associtations for boats
  - Add boat association to plans
  - Show boat on plan forms
  - Show only boat number on plan list, order boat dropdown by number.

## 2019-05-14

- Float Plans
  - Put an image of the original Float Plan mockup in the design folder
  - Add basic show, edit and update plans
  - Remove plans fixture as it was causing massive errors (due to column name change)
  - Remove static float plan page, hook up real float plan page
  - Add new plan button to index page

## 2019-05-13

- Float Plans!
  - Generate plan model and plans controller
  - Add routes
  - Add new view, as well as new and create actions. Change name of tide column to current.
  - Add some helper text to the new float plan form
  - Add basic index page

## 2019-05-12

- Hide last column on index pages on medium and smaller
- Add cancel buttons to edit pages
- Restrict static pages to users  
- Link to edit pager directly from boats index, don't show links to non-admins
- Add a logged in version of the home page.
- Fleet Pages
  - Generate boats controller
  - Generate boat model
  - Add new boat view
  - Refactor shared errors partial to accept objects
  - Add validations and tests to the boat model
  - Add integration tests for boat save/show
  - Refactor new boat form to partial
  - Add edit function and tests
  - Add index page and test
  - Swap out boat index page for static fleet page
  - Restrict boat view to logged in users, add destroy method and tests
  - Add new boat button to index page
  - Cast number as int to properly order boats index
  - Add unique index to boat number
- Refactor users list
- Add user destroy function
- Hide edit/delete buttons from non-admins

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
