class Watchlisting
  attr_accessor :viewer, :movie, :rating
  @@all = []
  def initialize(viewer, movie, rating=nil)
    @viewer = viewer
    @movie = movie
    @rating = rating
    @@all << self
  end

  # + Watchlisting.all
  #   + returns all of watchlistings
  def self.all
    @@all
  end

end
