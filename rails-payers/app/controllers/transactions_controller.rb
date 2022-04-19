class TransactionsController < ApplicationController

    # ? GET /point_total
    # returns total points for all users
    def point_total
        # debugger
        render json: {points: Transaction.sum(&:points)}
    end

    # ? POST /add_transaction
    # finds by payer and adds points
    # returns new user hash
    def add_transaction
        
    end

end
