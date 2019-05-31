require 'rails_helper'

RSpec.describe Volunteer, type: :model do
  	context 'something' do
  		before(:each) do         
	        file = fixture_file_upload(Rails.root.join('public', 'teste.png'), 'image/png')
	        @user = User.create!(email: "teste@teste.pt", password: "123", first_name: "Tiago", last_name: "Cunha", govid: file)
	        @user2 = User.create!(email: "teste2@teste.pt", password: "123", first_name: "Tiago", last_name: "Cunha", govid: file)
	        @user3 = User.create!(email: "teste3@teste.pt", password: "123", first_name: "Tiago", last_name: "Cunha", govid: file)
	        @user4 = User.create!(email: "teste4@teste.pt", password: "123", first_name: "Tiago", last_name: "Cunha", govid: file)
	        @user5 = User.create!(email: "teste5@teste.pt", password: "123", first_name: "Tiago", last_name: "Cunha", govid: file)
	        @user6 = User.create!(email: "teste6@teste.pt", password: "123", first_name: "Tiago", last_name: "Cunha", govid: file)
        end	
	  	it 'is not visible after 5 volunteers' do
	        req = Request.create!(user_id: @user.id, title: "title", body: "body", req_type: 1, lat: 39.1, lng: -9.3)
	        vol1 = Volunteer.create!(request_id: req.id, user_id: @user2.id)
	        vol2 = Volunteer.create!(request_id: req.id, user_id: @user3.id)
	        vol3 = Volunteer.create!(request_id: req.id, user_id: @user4.id)
	        vol4 = Volunteer.create!(request_id: req.id, user_id: @user5.id)
	        vol5 = Volunteer.create!(request_id: req.id, user_id: @user6.id)
	        expect(vol5.request).to have_attributes(:visible => false)
	    end
	end
end
