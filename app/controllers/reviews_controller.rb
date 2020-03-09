class ReviewsController < ApplicationController
  before_action :authenticate_consumer!
    def create
        @car = Car.find(params[:car_id])
        @car.reviews.create(review_params.merge(consumer: current_consumer))
        redirect_to car_path(@car)
    end

    private
  
    def review_params
      params.require(:review).permit(:message, :rating)
    end
end
