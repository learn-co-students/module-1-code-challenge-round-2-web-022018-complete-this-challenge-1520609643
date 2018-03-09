class Viewer
  attr_accessor :username

  @@all = []

  def initialize(username)
    @username = username
    self.class.all << self
  end

  def self.all
    @@all
  end

  def add_to_watchlist(movies)
    movies.each {|movie| WatchListing.new(self, movie)}
  end

  def rate_movie(movie, rating)
    watchlistings.find do |list|
      if list.movie == movie
        list.rating = rating
      end
    end
  end

  def movies
    watchlistings.map {|list| list.movie }
  end

  def watchlistings
    WatchListing.all.select {|list| list.viewer == self }
  end

end
