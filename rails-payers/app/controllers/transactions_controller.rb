class TransactionsController < ApplicationController

    # ? GET /point_total
    # returns total points for all users
    def point_total
        # debugger
        render json: {points: Transaction.sum(&:points)}
    end

    # ? POST /transaction
    # finds by payer and adds points
    # returns new user hash

end