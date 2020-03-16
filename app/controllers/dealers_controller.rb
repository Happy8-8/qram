class DealersController < ApplicationController
  def show
    @dealer = Dealer.find(params[:id])
  end

end
