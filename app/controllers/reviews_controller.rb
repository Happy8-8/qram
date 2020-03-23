class ReviewsController < ApplicationController
  before_action :authenticate_user!
    def create
        @car = Car.find(params[:car_id])
        @car.reviews.create(review_params.merge(user: current_user))
        redirect_to car_path(@car)
    end

    private
  
    def review_params
      params.require(:review).permit(:message, :rating)
    end
end
