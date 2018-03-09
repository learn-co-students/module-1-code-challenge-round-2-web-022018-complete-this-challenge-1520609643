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
