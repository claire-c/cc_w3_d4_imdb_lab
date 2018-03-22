require('pry')
require('pg')
require_relative('models/casting.rb')
require_relative('models/movie.rb')
require_relative('models/star.rb')
require_relative('db/sql_runner.rb')

Movie.delete_all()
Star.delete_all()
Casting.delete_all()


movie1 = { 'title' => 'Jaws', 'genre' => 'horror', 'rating' => '8' }
movie2 = { 'title' => 'Goodfellas', 'genre' => 'gangster', 'rating' => '9' }
movie3 = { 'title' => 'Home Alone', 'genre' => 'comedy', 'rating' => '6'}
movie4 = { 'title' => 'Alien', 'genre' => 'horror', 'rating' => '10'}

jaws = Movie.new(movie1)
goodfellas = Movie.new(movie2)
home_alone = Movie.new(movie3)
alien = Movie.new(movie4)

jaws.save_movie()
goodfellas.save_movie()
home_alone.save_movie()
alien.save_movie()

star1 = { 'first_name' => 'Joe', 'last_name' => 'Pesci' }
star2 = { 'first_name' => 'Sigourney', 'last_name' => 'Weaver' }
star3 = { 'first_name' => 'Bruce', 'last_name' => 'The Shark' }
star4 = { 'first_name' => 'Daniel', 'last_name' => 'Stern' }

joe = Star.new(star1)
sigourney = Star.new(star2)
bruce = Star.new(star3)
daniel = Star.new(star4)

joe.save_star()
sigourney.save_star()
bruce.save_star()
daniel.save_star()

casting1 = { 'movie_id' => jaws.id, 'star_id' => bruce.id, 'fee' => '50' }
casting2 = { 'movie_id' => goodfellas.id, 'star_id' => joe.id, 'fee' => '100000'}
casting3 = { 'movie_id' => home_alone.id, 'star_id' => joe.id, 'fee' => '786000' }
casting4 = { 'movie_id' => home_alone.id, 'star_id' => daniel.id, 'fee' => '123456' }
casting5 = { 'movie_id' => alien.id, 'star_id' => sigourney.id, 'fee' => '800000'}

bruce_casting = Casting.new(casting1)
joe_casting_gf = Casting.new(casting2)
joe_casting_ha = Casting.new(casting3)
daniel_casting = Casting.new(casting4)
sigourney_casting = Casting.new(casting5)

bruce_casting.save_casting()
joe_casting_gf.save_casting()
joe_casting_ha.save_casting()
daniel_casting.save_casting()
sigourney_casting.save_casting()

# joe.first_name = "Joey"
# joe.update_star()
#
# bruce_casting.fee = '25'
# bruce_casting.update_casting()
#
# jaws.genre = 'adventure'
# jaws.update_movie()
#
# daniel.delete()
sigourney_casting.delete()
# home_alone.delete()

#
