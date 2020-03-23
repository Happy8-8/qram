require 'rails_helper'

RSpec.describe CarsController, type: :controller do
  include Devise::Test::ControllerHelpers
  context "index action" do
    it "should return a successful response" do
      get :index
      expect(response.status).to eq 200
    end
  end

  context "new action" do
    it "should redirect unauthenticated users" do
      get :new
      expect(response.status).to eq 302
    end
  end

end
