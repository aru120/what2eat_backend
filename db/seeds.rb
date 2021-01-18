# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Restaurant.create!(yelpid: "12345", image: "test_image",name: "Kings Restaurant", categories: ["Chinese","English","You"])
Restaurant.create!(yelpid: "125555345", image: "test_image",name: "Queens Restaurant", categories: ["Chinese","English","You"])

Favorite.create!(user_id: 1, restaurant_id: 1)