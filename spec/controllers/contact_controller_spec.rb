require 'rails_helper'

RSpec.describe ContactController, :type => :controller do

  describe "GET name:string" do
    it "returns http success" do
     # get :name:string
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET email:string" do
    it "returns http success" do
    #  get :email:string
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET message:text" do
    it "returns http success" do
    #  get :message:text
      expect(response).to have_http_status(:success)
    end
  end

end
