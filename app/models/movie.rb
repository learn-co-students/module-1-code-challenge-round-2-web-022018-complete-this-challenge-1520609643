class Movie
  attr_accessor :title
  @@all = []
  def initialize(title)
    @title = title
    self.class.all << self
  end

  # + Movie.all
  #   + returns an array of all movies
  def self.all
    @@all
  end

  # + Movie#watchlistings
  #   + returns an array of all the watchlist objects that contain that movie
  def watchlistings
    Watchlisting.all.select {|x| x.movie == self}
  end

  # + Movie#viewers
  #   + returns all of the viewers who added this movie to their watchlist
  def viewers
    watchlistings.map {|x| x.viewer}
  end

  # + Movie#average_rating
  #   + returns the average of all ratings across all viewers watchlist ratings
  def average_rating
    sum = 0.0
    watchlistings.each {|x| sum += x.rating}
    sum / watchlistings.count
  end

  # + Movie.highest_rated
  #   + should return the movie with the highest average rating across all the viewers watchlistings
  def self.highest_rated
    all.sort_by {|x| x.average_rating}.last
  end
end
