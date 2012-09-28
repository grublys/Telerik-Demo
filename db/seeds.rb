# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
Contact.delete_all
Contact.create(first_name: 'Jim', last_name: 'Holmes',
               email: 'jim@iterativerose.com', linkedin_profile: 'http://www.linkedin.com/pub/jim-holmes/2/124/b02',
               lead_type: 'HOT')
Contact.create(first_name: 'Todd', last_name: 'Kaufman',
               email: 'toddkaufman@gmail.com', linkedin_profile: 'http://www.linkedin.com/pub/todd-kaufman/2/a58/1b1',
               lead_type: 'HOT')
Contact.create(first_name: 'Matthew', last_name: 'Boston',
               email: 'matthew.boston@gmail.com', linkedin_profile: 'http://www.linkedin.com/in/mboston',
               lead_type: 'NEUTRAL')

User.delete_all
User.create(username: 'testuser', password: 'abc123')
User.create(username: 'newuser', password: 'def456')
