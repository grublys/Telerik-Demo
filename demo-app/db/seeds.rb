# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
Contact.delete_all
Contact.create(first_name: 'John', last_name: 'Smith',
               email: 'john.smith@test.com', linkedin_profile: 'http://linkedin.com/in/john-smith',
               lead_type: 'HOT')
Contact.create(first_name: 'Jane', last_name: 'Doe',
               email: 'jane.doe@example.com', linkedin_profile: 'http://linkedin.com/in/jane-doe',
               lead_type: 'NEUTRAL')

# TEMPLATE
# Contact.create(first_name: '', last_name: '',
#                email: '', linkedin_profile: '',
#                lead_type: '')
