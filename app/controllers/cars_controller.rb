class CarsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  def index
    @cars = Car.paginate(page: params[:page], per_page: 4)
  end

  def new
    @car = Car.new
  end

  def create
    @car = current_user.cars.create(car_params)
    if @car.valid?
        redirect_to root_path
    else
        render :new, status: :unprocessable_entity
    end
  end


  def show
    @car = Car.find(params[:id])
    @review = Review.new
    @description = Description.new
    @photo = Photo.new 
  end

  def edit
    @car = Car.find(params[:id])

    if @car.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end
  end

  def update
    @car = Car.find(params[:id])
    if @car.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end
    
    @car.update_attributes(car_params)
    if @car.valid?
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @car = Car.find(params[:id])
    if @car.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end
  
    @car.destroy
    redirect_to root_path
  end


  private

  def car_params
    params.require(:car).permit(:name, :ddescription, :cdescription, :address)
  end
end
