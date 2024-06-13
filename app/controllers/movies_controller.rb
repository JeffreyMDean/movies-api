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
end
