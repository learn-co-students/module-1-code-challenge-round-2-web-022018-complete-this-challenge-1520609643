class Viewer
  attr_accessor :username
  @@all = []

  def initialize(username)
    @username = username
    self.class.all << self
  end
  # + Viewer.all
  #   + returns all of the viewers
  def self.all
    @@all
  end
  # + Viewer#add_to_watchlist(movies)
  #   + this method should receive an array of one or more movie instances and add them to the viewer's watchlisting
  def add_to_watchlist(movies)
    movies.each {|x| Watchlisting.new(self, x)}
  end
  # + Viewer#rate_movie(movie, rating)
  #   + given a movie on a viewer's watchlisting and a rating (a number between 1 and 5), assign the rating
  #   to the movie. Where should the rating
  #   that an individual viewer gives to an individual movie be stored?
  def rate_movie(movie, rating)
    rm = Watchlisting.all.find {|x| x.viewer == self && x.movie == movie}
    rm.rating = rating
  end

end
