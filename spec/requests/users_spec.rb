require 'rails_helper'

RSpec.describe "Users", type: :request do
  	describe "GET /profile" do
    	it "is denied without token" do
    		get "/profile"
      		expect(response).to have_http_status(:unauthorized)
    	end
  	end
end
