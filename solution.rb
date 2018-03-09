class Movie
  attr_accessor :title
  @@all = []

  def initialize(title)
    @title = title
    @@all << self
  end

  def self.all
    @@all
  end

  def watchlistings
    WatchListing.all.select do |x| x.movie == self end
  end

  def viewers
    watchlistings.select do |x| x.viewer end.uniq
  end

  def average_rating
    sum = 0.0
    watchlistings.each do |x| sum += x.rating end
    sum / watchlistings.length
  end

  def self.highest_rated
    @@all.sort_by do |x| x.average_rating end.last
  end
end

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

class WatchListing
  attr_accessor :viewer, :movie, :rating
  @@all = []

  def initialize(viewer, movie, rating=nil)
    @viewer = viewer
    @movie = movie
    @rating = rating
    @@all << self
  end

  def self.all
    @@all
  end
end
