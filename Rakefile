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

task :install do
end

def start
  puts "------------------------------------------------------"
  puts "Starting Rails Server"
  puts "------------------------------------------------------"
  puts "\nPress Ctrl-C to shutdown the server.\n\n"
  `rails server`
end

def migrate
  puts "------------------------------------------------------"
  puts "Migrating Database"
  puts "------------------------------------------------------"
  `rake db:migrate`
  puts "complete..."
end

def seed
  puts "------------------------------------------------------"
  puts "Seeding Database"
  puts "------------------------------------------------------"
  `rake db:seed`
  puts "complete..."
end
