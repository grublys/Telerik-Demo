# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

DemoApp::Application.load_tasks

task :default => [:demo]

task :demo do
  migrate
  seed
  iis
  start
end

def migrate
  puts "----------------------------------------------------------------"
  puts "STEP 1/4 Migrating Database"
  puts "----------------------------------------------------------------"
  `rake db:migrate`
  puts "complete..."
end

def seed
  puts "----------------------------------------------------------------"
  puts "STEP 2/4 Seeding Database"
  puts "----------------------------------------------------------------"
  `rake db:seed`
  puts "complete..."
end

def iis
  puts "----------------------------------------------------------------"
  puts "STEP 3/4 Start IIS"
  puts "----------------------------------------------------------------"
  puts "\nPlease deploy the demo_app folder to IIS at the url http://localhost:80/demo_app\n"
end

def start
  puts "----------------------------------------------------------------"
  puts "STEP 4/4 Starting Rails Server"
  puts "----------------------------------------------------------------"
  puts "\nYou may begin the demo. Visit: http://localhost:3000\n"
  puts "\nPress Ctrl-C to shutdown the server.\n\n"
  `rails server`
end
