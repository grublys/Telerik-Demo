#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

DemoApp::Application.load_tasks

task :default => [:demo]

task :demo do
  migrate
  seed
  start
end

def migrate
  puts "----------------------------------------------------------------"
  puts "STEP 1/3 Migrating Database"
  puts "----------------------------------------------------------------"
  `rake db:migrate`
  puts "complete..."
end

def seed
  puts "----------------------------------------------------------------"
  puts "STEP 2/3 Seeding Database"
  puts "----------------------------------------------------------------"
  `rake db:seed`
  puts "complete..."
end

def start
  puts "----------------------------------------------------------------"
  puts "STEP 3/3 Starting Rails Server"
  puts "----------------------------------------------------------------"
  puts "\nYou may begin the demo. Visit: http://localhost:3000\n"
  puts "\nPress Ctrl-C to shutdown the server.\n\n"
  `rails server`
end