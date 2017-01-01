require 'rails_helper'
require 'capybara/rails'

RSpec.describe WelcomeController, :type => :controller do

  describe "GET #index" do
    it "returns a 200 status code" do
      expect(response).to have_http_status 200
    end
  end
end
