# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "faker"
require_relative "../config/initializers/unsplash_scraper_service"

# Welcomer
puts "
███████╗██╗      █████╗ ████████╗    ███████╗███████╗███████╗██████╗ 
██╔════╝██║     ██╔══██╗╚══██╔══╝    ██╔════╝██╔════╝██╔════╝██╔══██╗
█████╗  ██║     ███████║   ██║       ███████╗█████╗  █████╗  ██║  ██║
██╔══╝  ██║     ██╔══██║   ██║       ╚════██║██╔══╝  ██╔══╝  ██║  ██║
██║     ███████╗██║  ██║   ██║       ███████║███████╗███████╗██████╔╝
╚═╝     ╚══════╝╚═╝  ╚═╝   ╚═╝       ╚══════╝╚══════╝╚══════╝╚═════╝ 
"

# Cleaning all DB model
puts "=============================="
count = Flat.count()
puts "Found #{count} Flat(s) in DB"
puts "Cleaning FLAT database..."
Flat.destroy_all
puts "=============================="

# Create loop_n number of Flat(s)
puts "How much Flat(s) you want ?"
puts "> "
loop_n = STDIN.gets.chomp

# Create fake Flat
puts "Creating #{loop_n} fake Flat(s),"
puts "please wait..."

loop_n.to_i.times do
  flat = Flat.new(
    name: "#{Faker::Address.community} in #{Faker::Address.city}",
    address: Faker::Address.full_address,
    description: Faker::GreekPhilosophers.quote,
    price_per_night: Faker::Number.within(range: 30..120),
    number_of_guests: Faker::Number.within(range: 2..10),
    picture: UnsplashScraperService.new.call
  )
  flat.save!
end

# Done
puts "=============================="
puts "Congrats, #{Flat.count} flat(s) was created!"
puts "=============================="
