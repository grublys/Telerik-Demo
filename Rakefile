#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

DemoApp::Application.load_tasks

task :default => [:demo]

task :demo do
  migrate
  seed
  rails
  iisexpress
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

def rails
  puts "----------------------------------------------------------------"
  puts "STEP 3/4 Starting Rails Server"
  puts "----------------------------------------------------------------"
  `rails server`
end

def iisexpress
  puts "----------------------------------------------------------------"
  puts "STEP 4/4 Starting IISExpress Server"
  puts "----------------------------------------------------------------"
  puts "\nYou may begin the demo. Visit: http://localhost:3000\n"
  puts "\nPress Ctrl-C to shutdown the server.\n\n"

  path_to_iisExpress = File.join(tools_path, 'IIS Express', 'iisexpress.exe')

  output = IO.popen(path_to_iisExpress) do |pipe|
      sleep 3 #seconds
      Process.kill("KILL", pipe.pid)
      pipe.close
  end

  puts 'IIS Express successfully kickstarted.'
end
