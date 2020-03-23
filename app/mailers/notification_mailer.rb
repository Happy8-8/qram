class NotificationMailer < ApplicationMailer
  default from: "no-reply@qramapp.com"

    def description_added(description)
        @car = description.car
        @car_owner = @car.user
        mail(to: @car_owner.email,
        subject: "A description has been added to #{@car.name}")
    end   

    def review_added(review)
      @car = review.car
      @car_owner = @car.user
      mail(to: @car_owner.email,
      subject: "A description has been added to #{@car.name}")
  end   
end