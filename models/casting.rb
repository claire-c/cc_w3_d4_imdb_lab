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

end
