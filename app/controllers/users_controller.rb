class UsersController < ApplicationController

    def show
        render json: find_user
    end

    def create
        render json: User.create!(user_params), staus: 201
    end
    
    def total_points
        user = find_user
        render json: {points: user.total_points}
    end

    def points_balance
        user = find_user
        payer_output = {}
        user.transactions.each do |t|
            if payer_output[t.payer.name]
                payer_output[t.payer.name] += t.points
            else
                payer_output[t.payer.name] = t.points
            end
        end
        render json: payer_output
    end

    private

    def user_params
        params.permit(:name)
    end

    def find_user
        User.find(params[:id])
    end
end
