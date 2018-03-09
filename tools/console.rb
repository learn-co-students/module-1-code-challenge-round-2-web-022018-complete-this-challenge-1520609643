require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

gm = Movie.new("Good Movie")
bm = Movie.new("Bad Movie")
sm = Movie.new("Shitty Movie")

el = Viewer.new("Elton John")
jl = Viewer.new("John Lennon")

rev1 = WatchListing.new(el, bm, 1.0)
rev2 = WatchListing.new(jl, bm, 2.0)
rev3 = WatchListing.new(jl, bm, 3.0)
rev4 = WatchListing.new(el, gm, 4.0)
rev5 = WatchListing.new(jl, gm, 5.0)

Pry.start
