require('pry')
require('pg')

class Star

  attr_reader :id
  attr_accessor :first_name, :last_name

  def initialize(star_hash)
    @first_name = star_hash['first_name']
    @last_name = star_hash['last_name']
    @id = star_hash['id'].to_i if star_hash['id']
  end

  def save_star()
    sql = "
    INSERT INTO stars
      (first_name, last_name)
      VALUES
      ($1, $2)
      RETURNING id;
    "
    values = [@first_name, @last_name]
    star = SqlRunner.run(sql, values)
    @id = star[0]['id']
  end

  def self.delete_all()
    sql = "DELETE FROM stars;"
    SqlRunner.run(sql)
  end



  def update_star()
    sql = "
      UPDATE stars
        SET (first_name, last_name)
        = ($1, $2)
        WHERE id = $3;
    "
    values = [@first_name, @last_name, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "
    DELETE FROM stars
      WHERE id = $1;"

    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all_stars()
    sql = "SELECT * FROM stars;"
    pg_array = SqlRunner.run(sql)
    result = pg_array.map { |star| Star.new(star) }
    return result
  end


#get all the movies the star has been in via castings
  def get_movies()
    sql = "
    SELECT movies.* FROM movies
    INNER JOIN castings
    ON castings.movie_id = movies.id
    WHERE star_id = $1;
    "
    values = [@id]
    pg_array = SqlRunner.run(sql, values)
    movies = pg_array.map { |movie| Movie.new(movie) }
    return movies
  end



end
