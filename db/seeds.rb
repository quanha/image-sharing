# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  User.create(email: 'admin@example.com', password: '12345678', password_confirmation: '12345678', first_name: 'Smart',
              last_name: 'Admin', role: 'admin', confirmation_token: nil, confirmed_at: DateTime.strptime("09/14/2009 8:00", "%m/%d/%Y %H:%M"))
  Category.create(name: 'Collections', description: 'Collection of items', at_homepage: 1)