require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

abby = Viewer.new("Abby")
zach = Viewer.new("Zach")
stacy = Viewer.new("Stacy")

star_wars = Movie.new("Star Wars")
star_trek = Movie.new("Star Trek")
godfather = Movie.new("Godfather")

w1 = WatchListing.new(abby, star_wars, 5)
w2 = WatchListing.new(zach, star_trek, 4)
w3 = WatchListing.new(stacy, godfather, 3)
w4 = WatchListing.new(zach, star_wars, 4)


Pry.start
