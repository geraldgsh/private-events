# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name:  "batman",
             email: "batman@email.com")

9.times do |n|
  name  = Faker::Name.name
  email = "batman-#{n+1}@email.com"
  password = "password"
  User.create!(name:  name,
               email: email)
end