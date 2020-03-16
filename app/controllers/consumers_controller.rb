class ConsumersController < ApplicationController
  def show
    @consumer = Consumer.find(params[:id])
  end
end
