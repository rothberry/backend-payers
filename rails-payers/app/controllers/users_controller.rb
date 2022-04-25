class UsersController < ApplicationController

    def show
        render json: find_user
    end

    def total_points
        user = find_user
        render json: {points: user.total_points}
    end

    def create
        render json: User.create!(user_params), staus: 201
    end

    private

    def user_params
        params.permit(:name)
    end

    def find_user
        User.find(params[:id])
    end
end
