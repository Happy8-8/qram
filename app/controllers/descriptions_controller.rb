class DescriptionsController < ApplicationController
  before_action :authenticate_user!
    def create
        @car = Car.find(params[:car_id])
        @car.descriptions.create(description_params.merge(user: current_user))
        redirect_to car_path(@car)
    end

    private
  
    def description_params
      params.require(:description).permit(:message, :rating)
    end
end