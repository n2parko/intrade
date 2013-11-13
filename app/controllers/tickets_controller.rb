class TicketsController < ApplicationController
    
    before_filter :find_movie
    before_filter :find_ticket, only => [:show]
    
    def show
        if @ticket.update_attributes(onmarket: false)
            flash[:flash] = "You did it"
            redirect_to @movie
        else
            flash[:alert] = "Uh Oh"
            redirect_to @movie
        end
    end
    
    def new
    end
    
    def create
        @ticket = @movie.tickets.build(ticket_params)
        if @ticket.save
            flash[:flash] = "You did it"
            redirect_to @movie
        else
            flash[:alert] = "Order didn't go through! Try again!"
            redirect_to @movie
        end
    end
    
    
    private
    def ticket_params
        params.require(:ticket).permit(:size, :price, :buy, :onmarket, :movie_id)
    end
    
    private
    def find_ticket
        @ticket = Ticket.find(params[:id])
        rescue ActiveRecord::RecordNotFound
        flash[:alert] = "The bid/offer wasn't taken off the table!"
        #redirect_to show_movie_path
    end
    
    private
    def find_movie
        @movie = Movie.find(params[:movie_id])
        rescue ActiveRecord::RecordNotFound
        flash[:alert] = "The movie that you're looking for doesn't exist"
        redirect_to movies_path
    end
    
    
end
