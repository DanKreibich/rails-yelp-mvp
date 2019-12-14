# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Restaurant.destroy_all
puts "deletes all restaurants"
cuisine = ['chinese', 'italian', 'japanese', 'french', 'belgian']

5.times do
  restaurant = Restaurant.new(
    name: Faker::FunnyName.name,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.cell_phone,
    category: cuisine.sample
  )
  restaurant.save
end

puts '5 new restaurants have been created'

# creates 1 review per restaurant
Restaurant.all.each do |restaurant|
  3.times do
    review = Review.new(
      restaurant: restaurant,
      content: Faker::Lorem.sentence(word_count: 10),
      rating: rand(5)
    )
    review.save
  end
end
puts 'added reviews'

