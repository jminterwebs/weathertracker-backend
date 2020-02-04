##Backend Rails App for Weathertracker

To be used along with [Weather Track Frontend](https://github.com/jminterwebs/weathertrack-frontend)

This app pulls data from the [Darksky API](https://darksky.net/dev) and saves it to a database. To seed the database the past 30 days of weather are parsed for both LA and NYC. After that there is a cron job that runs which will update the weather every day.

######App uses Postgres set up for Postgres can be found [here](https://www.digitalocean.com/community/tutorials/how-to-set-up-ruby-on-rails-with-postgres)

1. Clone down repo 
2. run `bundle install`
3. run `rake db:create db:migrate db:seed`
4. `rails s`

To run crontab.

A gem called crono is installed. This gem will run a cron job every day to grab yesterdays weather. 

To start the cron job run the following in terminal
`bundle exec crono RAILS_ENV=development`

