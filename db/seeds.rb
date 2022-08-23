# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

10.times do |n|
  Offer.create(title: "Offer #{n}", description: "Description #{n}", date: "2020-08-22", hourly_rate: "10.00", location: "Location #{n}", user_id: 1)
end
