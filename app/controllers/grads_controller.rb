#This is mostly copied over from the RottenPotatoes stuff for now
#It's pretty much a blank slate, until we figure out a little more
class GradsController < ApplicationController

  def params
    
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    
  end

  def new
    # default: render 'new' template
  end
  
  #def with_ratings(ratings)
  #  @movies = Movie.where(rating: ratings.keys)
  #end

end
