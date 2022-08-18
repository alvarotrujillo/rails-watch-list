# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'open-uri'
require 'json'

puts 'Clearing database...'
Movie.destroy_all

puts 'Loading up database'

url = 'https://tmdb.lewagon.com/movie/top_rated'
response = URI.open(url).read
result = JSON.parse(response)

array = result['results']

array.each_with_index do |item, _i|
  movies = Movie.new(
    title: item['title'],
    overview: item['overview'],
    poster_url: item['poster_path'],
    rating: item['vote_average']
  )
  movies.save!
end

puts 'done'

# poster_url: `https://image.tmdb.org/t/p/w200/#{item['poster_path']}`,
