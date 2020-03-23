class PhotosController < ApplicationController
  before_action :authenticate_user!
    def create
        @car = Car.find(params[:car_id])
        @car.photos.create(photo_params.merge(user: current_user))
        redirect_to car_path(@car)
    end
    private
  
    def photo_params
      params.require(:photo).permit(:caption, :picture)
    end
end
