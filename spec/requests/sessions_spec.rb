require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "post /login" do
    it "unauthorized login returns message" do
      post "/login", params: {email: "user0@test.com", password: "123"	}
      expect(response.body).to include("Wrong username and/or password")
    end

    it "authorized login returns token" do
      @file = fixture_file_upload(Rails.root.join('public', 'teste.png'), 'image/png')
  	  @test_user = User.new(email: "teste@teste.pt", password: "123", first_name: "Tiago", last_name: "Cunha", govid: @file).save

      post "/login", params: {email: "teste@teste.pt", password: "123"	}
      expect(response.body).to include("token")
    end
  end
end
