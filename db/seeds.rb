# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Book.destroy_all
User.destroy_all

5.times{Book.create(ttitle:Faker::Book.title, author:Faker::Book.author, publisher:Faker::Book.publisher, genre:Faker::Book.genre, synopsis: "lerem ipsum dgter ieuyeyi hyeyuuenijdygdujj")}
5.times{User.create(username:Faker::Name.name, paassword: Faker::Name.name , confirm_password:Faker::Name.name)}

puts "done seeding..."