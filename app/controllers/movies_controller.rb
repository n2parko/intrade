class MoviesController < ApplicationController
    
    before_filter :find_movie, :except => [:index, :new, :create]
    
    def index
        @movies = Movie.all
    end
    
    def show
        @available_bids = @movie.tickets.available.bid
        @available_asks = @movie.tickets.available.ask
    end
    
    def create
        @movie = Movie.new(movie_params)
        if @movie.save
            flash[:notice] = "Movie created"
            redirect_to movies_path
        else
            flash[:alert] = "Movie not saved!"
            redirect_to new_movie_path
        end
    end
    
    def new
        @movie = Movie.new
    end
    
    def destroy
        @movie.destroy
        flash[:notice] = "Movie deleted"
        redirect_to movies_path
    end
    
    private
    def movie_params
        params.require(:movie).permit(:name)
    end
    
    private
    def find_movie
        @movie = Movie.find(params[:id])
        rescue ActiveRecord::RecordNotFound
        flash[:alert] = "The movie that you're looking for doesn't exist"
        redirect_to movies_path
    end
    
end
