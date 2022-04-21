class TransactionsController < ApplicationController

    # ? GET /point_total
    # returns total points for all users
    def spend_points
        # debugger
        # render json: {points: Transaction.sum(&:points)}
    end

    # ? POST /add_transaction
    # finds by payer and adds points
    # returns new user hash
    def add_transaction
        
    end

    private

    def transaction_params
        params.permit(:user_id, :payer_id, :points, :timestamp)
    end

end
