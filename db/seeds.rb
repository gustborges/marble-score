# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Deleting users and scores"

if Rails.env.development?
  Score.destroy_all
  User.destroy_all
end

puts "Seeding users"

admin = User.create!(
  name: "Admin User",
  email: "admin@marble.so",
  admin: true,
  password: "marbleso"
)

alexey = User.create!(
  name: "Alexey Sytnikov",
  email: "alexey@marble.so",
  password: "marbleso"
)

gustavo = User.create!(
  name: "Gustavo Borges",
  email: "gustborges@gmail.com",
  password: "marbleso"
)

marc = User.create!(
  name: "Marc Seitz",
  email: "marc@marble.so",
  password: "marbleso"
)

anna = User.create!(
  name: "Anna Kariennina",
  email: "anna@marble.so",
  password: "marbleso"
)

puts "Adding scores"

gustavo_score = Score.create!(
  user_id: gustavo.id,
  total: 52
)

marc_score = Score.create!(
  user_id: marc.id,
  total: 84
)

alexey_score = Score.create!(
  user_id: alexey.id,
  total: 91
)

anna_score = Score.create!(
  user_id: anna.id,
  total: 43
)

puts "Seeded!"
