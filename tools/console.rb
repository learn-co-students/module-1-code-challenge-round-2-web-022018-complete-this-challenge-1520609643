require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

movie1 = Movie.new("star wars")
movie2 = Movie.new("harry potter")

matt = Viewer.new("Matt")
abby = Viewer.new("Abby")
paul = Viewer.new("Paul")

watch1 = Watchlisting.new(matt, movie1, 5)
watch2 = Watchlisting.new(paul, movie1, 4)
watch3 = Watchlisting.new(abby, movie1, 5)
watch4 = Watchlisting.new(matt, movie2, 3)
watch5 = Watchlisting.new(abby, movie2, 3)

Pry.start
