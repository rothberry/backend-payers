class TransactionsController < ApplicationController

    # ? POST /add_transaction
    # finds user by id
    # finds (or creates) payer by name
    # creates transaction instance with all the data
    # returns transaction plus user/payer data
    def add_transaction
        current_user = User.find(params[:user_id])
        found_or_created_payer = Payer.find_or_create_by(name: params[:payer])
        transaction = Transaction.create!(user: current_user, payer: found_or_created_payer, points: params[:points], timestamp: params[:timestamp])
        render json: transaction, include: [:user, :payer]
    end
    
    # ? POST /spend_points
    def spend_points
        current_user = User.find(params[:user_id])
        current_total = params[:points]

        output = []

        i = 0

        while current_total > 0 && current_user.transactions.length > i
            current_transaction = current_user.transactions[i]
            current_total -= current_transaction.points
            if current_total >= 0
                output << {payer: current_transaction.payer.name, points: -current_transaction.points}
                current_transaction.points = 0
            else
                current_transaction.points = current_total.abs
                output << {payer: current_transaction.payer.name, points: -current_total}
                
            end
            # current_transaction.save
            i+=1
        end
        # debugger
        render json: output
    end

    def index
        render json: Transaction.all, include: [:payer]
    end

    def show
        render json: Transaction.find(params[:id])
    end

    private

    def transaction_params
        params.permit(:user, :payer_id, :points, :timestamp)
    end

end
