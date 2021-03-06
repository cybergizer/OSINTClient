# OSINT Client

## Local Machine

Clone repo to the local machine:
 - `git@github.com:cybergizer/OSINTClient.git`

Run Bundler and install missing gems:
  - `bundle`
  
Create PostgreSQL database
  - `createdb rzh_development`
  
Run migrations
 - `bundle exec rake db:migrate`
 
Run local version of the application
 - `bundle exec sidekiq -r ./app/workers/process_worker.rb`
 
## Deploy on Heroku

Create Heroku application
  - `heroku create`
  
Configure required addons:
  - `heroku addons:create redistogo:nano`
  - `heroku config:set REDIS_PROVIDER=REDISTOGO_URL`
  - `heroku addons:create heroku-postgresql:hobby-dev`
  
Push latest changes of the code to the server
  - `git push heroku master`
  
Ensure you're running at least one web worker
  - `heroku ps:scale worker=1`
  
Run Migrations:
  - `heroku run rake db:migrate`
  
Restart the application
  - `heroku restart`

