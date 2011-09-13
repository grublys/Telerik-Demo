## Getting Started ##

Clone the repo

```$ git clone git@github.com:PillarTechnology/Telerik-Demo.git```

## Development ##

Install missing bundles

```$ bundle install```

Run the migrations

```$ rake db:migrate```

Seed the database with values from `db/seeds.rb`

```$ rake db:seed```

NOTE: Running `rake db:seed` will delete all values in the database to refresh to a known state.

Start the rails server

```$ rails server```

## Deploying to Production ##

Add a remote location for git to push to

```$ git remote add heroku git@heroku.com:growing-planet-634.git```

Push to heroku

```$ git push heroku master```

Run the migrations [if needed]

```$ heroku run rake db:migrate```

Seed the production database [if needed]

```$ heroku run rake db:seed```
