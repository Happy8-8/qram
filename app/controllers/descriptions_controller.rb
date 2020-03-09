class DescriptionsController < ApplicationController
  before_action :authenticate_dealer!
    def create
        @car = Car.find(params[:car_id])
        @car.descriptions.create(description_params.merge(dealer: current_dealer))
        redirect_to car_path(@car)
    end

    private
  
    def description_params
      params.require(:description).permit(:message, :rating)
    end
end