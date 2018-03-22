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




end
