# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(:email => "supe.s.kunal@gmail.com", :password => "admin123", :password_confirmation => "admin123", :admin => true)
Plan.create(name: "Free", price: 0.0, limit: 20)
Plan.create(name: "Premium", price: 3500.0, limit: 100)

