# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

250.times do
  User.create([{ username: Faker::Internet.user_name }])
end

users = User.all.length

750.times do
  Artwork.create([{ title: Faker::Lorem.words(rand(1..4)),
                    artist_id: rand(1..users),
                    img_url: Faker::Internet.url }])
end

artworks = Artwork.all.length

1500.times do
  ArtworkShare.create([{ artwork_id: rand(1..artworks),
                         viewer_id: rand(1..users) }])
end

1000.times do
  Comment.create([{ artwork_id: rand(1..artworks),
                    author_id: rand(1..users),
                    body: Faker::Lorem.words(rand(4..25)) }])
end
