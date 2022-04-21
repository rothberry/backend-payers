class UsersController < ApplicationController

    def show
        render json: User.find(params[:id])
    end

    def create
        render json: User.create!(user_params), staus: 201
    end

    private

    def user_params
        params.permit(:name)
    end
end
