class Movie
  attr_accessor :title

  @@all = []

  def initialize(title)
    @title = title
    self.class.all << self
  end

  def self.all
    @@all
  end

  def watchlistings
    WatchListing.all.select {|list| list.movie == self }
  end

  def viewers
    watchlistings.map {|movie| movie.viewer }
  end

  def average_rating
    sum = 0
    watchlistings.each {|list| sum += list.rating}
    sum/watchlistings.size.to_f
  end

  def self.highest_rated
    WatchListing.all.sort_by {|list| list.rating}.last
  end

end
