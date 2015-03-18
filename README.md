## Getting Started ##

Clone the repo

```$ git clone git@github.com:PillarTechnology/Telerik-Demo.git```

Setup the environment (windows)

```$ .\script\EnvInstall.bat```

## Running the Demo ##

### Windows ###

```$ demo.bat```

### Mac OS X ###

```$ rake demo```

## Development ##

Note: If rake fails to run and gives you an error message similar to "You have already activated rake 0.9.2, but your Gemfile requires rake 0.8.7" then use "bundle exec" instead of "bundle" in the commands below.

Note: If "bundle exec" (as shown above) still doesn't solve your Rake issue, then try removing the troublesome Rake version. Use "gem uninstall rake" at which point you'll be prompted to select which version to remove. Select version 0.9.2 to remove. After that process finishes then continue with the steps below, starting wtih "bundle install".

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

Production URL is http://growing-planet-634.herokuapp.com/welcome

Add a remote location for git to push to [first time only]

```$ git remote add```

Push to heroku

```$ git push heroku master```

Run the migrations [if needed]

```$ heroku run rake db:migrate```

Seed the production database [if needed]

```$ heroku run rake db:seed```

NOTE: Running `heroku run rake db:seed` will delete all values in the production database to refresh to a known state.
