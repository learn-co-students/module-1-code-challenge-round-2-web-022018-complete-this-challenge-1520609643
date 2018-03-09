class Viewer
  attr_accessor :username
  @@all = []

  def initialize(username)
    @username = username
    @@all << self
  end

  def self.all
    @@all
  end

  def add_to_watchlist(movies)
    movies.each do |x| WatchListing.new(self, x) end
  end

  def rate_movie(movie, rating)
    this = WatchListing.all.find do |x| x.movie == movie && x.viewer == self end
    this.rating = rating
  end
end
