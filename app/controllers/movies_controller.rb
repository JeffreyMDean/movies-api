class MoviesController < ApplicationController
  def index  
    @movies = Movie.all
    render :index
  end

  def create
    @movie = Movie.create( #creates new movie instance and saves it to the database in a single step
      title: params[:title],
      genre: params[:genre],
      year: params[:year]
    )
    render :show #renders show view template where @movie instance is now available there..and by using show it ensures the user can see the newly created movie
  end

  def show
    @movie = Movie.find_by(id: params[:id])
    render :show
  end
  # @movie is an instance variable that holds a single photo record fetched from the database
  # Photo.find_by(id: params[:id]) queries the Photo model/table in the database to find a photo record whose id matches params[:id]
  # params[:id] retrieves the id parameter from the URL. In RESTful routing, this typically corresponds to the ID of the photo being requested.
end
