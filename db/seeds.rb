# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'net/http'
require 'uri'
require 'faker'
require 'debug'

50.times do
  cat_url = JSON.parse(Net::HTTP.get(URI.parse('https://api.thecatapi.com/v1/images/search')))[0]['url']

  Pet.create!(
    name: Faker::Creature::Cat.name,
    breed: Faker::Creature::Cat.breed,
    description: Faker::Lorem.sentence,
    url: cat_url
  )
end
