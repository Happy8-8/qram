class PhotosController < ApplicationController
  before_action :authenticate_dealer!
    def create
        @car = Car.find(params[:car_id])
        @car.photos.create(photo_params.merge(dealer: current_dealer))
        redirect_to car_path(@car)
    end
    private
  
    def photo_params
      params.require(:photo).permit(:caption, :picture)
    end
end
