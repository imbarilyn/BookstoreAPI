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

5.times{Book.create(title:Faker::Book.title, author:Faker::Book.author, publisher:Faker::Book.publisher, genre:Faker::Book.genre, synopsis: "lerem ipsum dgter ieuyeyi hyeyuuenijdygdujj", price: Faker::Number.between(from: 10, to: 100), year_of_publisher:Faker::Date.backward(days: 14), author_id: Faker::Number.between(from: 1, to: 5), publisher_id: Faker::Number.between(from: 1, to: 5))}
5.times{User.create(username:Faker::Name.name, password: Faker::Name.name , confirm_password:Faker::Name.name)}
5.times{Publisher.create(first_name:Faker::Name.female_first_name, last_name:Faker::Name.female_last_name)}
5.times{Author.create(first_name:Faker::Name.female_first_name, last_name:Faker::Name.female_last_name)}

puts "Done seeding..."