require('pry')
require('pg')

class Movie

  attr_reader :id, :title, :genre
  attr_accessor :rating

  def initialize(movie_hash)
    @title = movie_hash['title']
    @genre = movie_hash['genre']
    @rating = movie_hash['rating'].to_i
    @id = movie_hash['id'].to_i if movie_hash['id']
  end

end
