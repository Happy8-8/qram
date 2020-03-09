class CarsController < ApplicationController
  before_action :authenticate_dealer!, only: [:dnew, :dcreate, :dedit, :dupdate, :destroy]
  before_action :authenticate_consumer!, only: [:cnew, :ccreate, :cedit, :cupdate]
  def index
      @cars = Car.paginate(page: params[:page], per_page: 4)
    end

    def dnew
      @car = Car.new
    end

    def cnew
      @car = Car.new
    end

    def dcreate
      @car = current_dealer.cars.create(car_params)
      if @car.valid?
          redirect_to root_path
      else
          render :dnew, status: :unprocessable_entity
      end
    end

    def ccreate
      @car = current_consumer.cars.create(car_params)
      if @car.valid?
          redirect_to root_path
      else
          render :cnew, status: :unprocessable_entity
      end
    end


    def show
      @car = Car.find(params[:id])
      @review = Review.new
      @description = Description.new
      @photo = Photo.new 
    end

    def dedit
      @car = Car.find(params[:id])

      if @car.dealer != current_dealer
        return render plain: 'Not Allowed', status: :forbidden
      end
    end

    def cedit
      @car = Car.find(params[:id])

      if @car.consumer != current_consumer
        return render plain: 'Not Allowed', status: :forbidden
      end
    end

    def dupdate
      @car = Car.find(params[:id])
      if @car.dealer != current_dealer
        return render plain: 'Not Allowed', status: :forbidden
      end
      
      @car.update_attributes(car_params)
      if @car.valid?
        redirect_to root_path
      else
        render :dedit, status: :unprocessable_entity
      end
    end


    def cupdate
      @car = Car.find(params[:id])
      if @car.consumer != current_consumer
        return render plain: 'Not Allowed', status: :forbidden
      end
      
      @car.update_attributes(car_params)
      if @car.valid?
        redirect_to root_path
      else
        render :cedit, status: :unprocessable_entity
      end
    end

    def destroy
      @car = Car.find(params[:id])
      if @car.dealer != current_dealer
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
