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

end
