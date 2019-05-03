# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Creating listings'
Listing.destroy_all
10.times do
  params = {
    title: Faker::Restaurant.unique.name,
    location: Faker::Address.unique.full_address,
    cost: rand(100),
    description: Faker::Lorem.paragraph,
    bathroom_availability: true
  }
puts "Creating Listing: #{params[:title]}"
listing = Listing.new(params)
listing.save
end

puts 'Creating an admin user'
User.new({ :email => 'admin@admin.com.au', :password => 'password321', :password_confirmation => 'password321', :admin => 'true'}).save

puts "Seeding Over"