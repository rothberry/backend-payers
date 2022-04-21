class PayersController < ApplicationController

    def index
        render json: Payer.all
    end
    
    def show
        render json: Payer.find(params[:id])
    end

    def create
        # debugger
        render json: Payer.create!(payer_params), status: 201
    end

    private

    def payer_params
        params.permit(:name)
    end
end
