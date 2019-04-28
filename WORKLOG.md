# Worklog

## TODO

- Bootstrap
- Placeholders for basic IA
- Custom guard file
- User setup (a la railstutorial, won't hurt to go trough that again)
- Update web server on heroku: https://devcenter.heroku.com/articles/ruby-default-web-serverr

## 2019-04-27

- [Initialize git](https://www.atlassian.com/git/tutorials/setting-up-a-repository) 
- [Created a SSH Key and added it to github](https://help.github.com/en/articles/connecting-to-github-with-ssh)
- Set up new IDE on Cloud9
- Create new Rails app (using the the [Rails Tutorial](https://www.railstutorial.org/book/beginning) as a guide)
  - printf "install: --no-rdoc --no-ri\nupdate:  --no-rdoc --no-ri\n" >> ~/.gemrc
  - gem install rails (installed latest, 5.2.3)
  - Moved sqlite to development/test group in gemfile
  - Added a production group in gemfile, included postgres gem
  - Updated gemfile w/o installing pg locally: bundle install --without production
  - Installed heroku: source <(curl -sL https://cdn.learnenough.com/heroku_install)
  - Heroku login from command line: heroku login -i
  - Test deployment with hello world
- Created a static pages controller
- Added minitest reporters to gem file
