require('pry')
require('pg')

class Casting

  attr_reader :id, :movie_id, :star_id
  attr_accessor :fee

  def initialize(casting_hash)
    @movie_id = casting_hash['movie_id'].to_i
    @star_id = casting_hash['star_id'].to_i
    @fee = casting_hash['fee'].to_i
    @id = casting_hash['id'].to_i if casting_hash['fee']
  end

  def save_casting()
    sql = "
      INSERT INTO castings
      (movie_id, star_id, fee)
      VALUES
      ($1, $2, $3)
      RETURNING id
      "
    values = [@movie_id, @star_id, @fee]
    casting = SqlRunner.run(sql, values)
    @id = casting[0]['id']
  end

  def self.delete_all()
    sql = "DELETE FROM castings;"
    SqlRunner.run(sql)
  end

  def update_casting()
    sql = "
      UPDATE castings
      SET (movie_id, star_id, fee)
      = ($1, $2, $3)
      WHERE id = $4;
    "
    values = [@movie_id, @star_id, @fee, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "
    DELETE FROM castings
      WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end





end
