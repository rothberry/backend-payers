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
        puts "***SPENDING POINTS***"
        current_user = User.find(params[:user_id])
        current_total = params[:points].to_i
        # If user doesn't have enough total points, send error message
        if current_total > current_user.total_points
            render json: {error: "NOT ENOUGH POINTS"}, status: :unprocessable_entity
        else
            output = []
            i = 0
            while current_total > 0 && current_user.transactions.length > i
                current_transaction = current_user.transactions[i]
                if current_transaction.points == 0 
                    i += 1
                else
                    # p "trans----"
                    # p current_transaction
                    current_total -= current_transaction.points
                    # p "total-----"
                    # p current_total
                    if current_total >= 0
                        output << {payer: current_transaction.payer.name, points: -current_transaction.points}
                        current_transaction.points = 0
                    else
                        output << {payer: current_transaction.payer.name, points: -(current_transaction.points + current_total)}
                        current_transaction.points = current_total.abs
                    end
                    current_transaction.save
                    i+=1
                end
            end
            # debugger
            render json: output
        end
    end

    def index
        render json: Transaction.order(:timestamp), include: [:payer]
    end

    def show
        render json: Transaction.find(params[:id])
    end

    private

    def transaction_params
        params.permit(:user, :payer_id, :points, :timestamp)
    end

end
