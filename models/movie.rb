require('pry')
require('pg')
require_relative('../db/sql_runner.rb')

class Movie

  attr_reader :id
  attr_accessor :rating, :title, :genre

  def initialize(movie_hash)
    @title = movie_hash['title']
    @genre = movie_hash['genre']
    @rating = movie_hash['rating'].to_i
    @id = movie_hash['id'].to_i if movie_hash['id']
  end

  def save_movie()
    sql = "
      INSERT INTO movies
      (title, genre, rating)
      VALUES
      ($1, $2, $3)
      RETURNING id;
    "
    values = [@title, @genre, @rating]
    movie = SqlRunner.run(sql, values)
    @id = movie[0]['id']
  end

  def self.delete_all()
    sql = "DELETE FROM movies;"
    SqlRunner.run(sql)
  end

  def update_movie()
    sql = "
    UPDATE movies
      SET (title, genre, rating)
      = ($1, $2, $3)
      WHERE id = $4;
    "
    values = [@title, @genre, @rating, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "
    DELETE FROM movies
      WHERE id = $1;
    "
    values = [@id]
    SqlRunner.run(sql, values)
  end


end
