# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Product.destroy_all
Review.destroy_all

50.time do |index|
  product = Product.create!({name: Faker::Superhero.random, origin: Faker::Address.city, cost: Faker::Number.number(digits: 2)})
  250.times do |index|
    Review.create!({author: Faker::Name.name, content_body: Faker::Books::Dune.quote, product_id: product_id })
  end
end

p "Created #{Product.count} products."
p "Created #{Review.count} reviews."