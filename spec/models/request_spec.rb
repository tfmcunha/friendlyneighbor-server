require 'rails_helper'

RSpec.describe Request, type: :model do
  	context 'validations' do  	
      before(:each) do         
        file = fixture_file_upload(Rails.root.join('public', 'teste.png'), 'image/png')
        @user = User.create!(email: "teste@teste.pt", password: "123", first_name: "Tiago", last_name: "Cunha", govid: file)        
      end	

  		it 'is not valid without user_id' do
  			req = Request.new(user_id: nil, title: "title", body:"body", req_type: 0, lat: 39.1, lng: -9.3)
  			expect(req).to_not be_valid
  		end

  		it 'is not valid without title' do
  			req = Request.new(user_id: @user.id, title: nil, body:"body", req_type: 0, lat: 39.1, lng: -9.3)
  			expect(req).to_not be_valid
  		end

  		it 'is not valid without body' do
  			req = Request.new(user_id: @user.id, title: "title", body: nil, req_type: 0, lat: 39.1, lng: -9.3)
  			expect(req).to_not be_valid
  		end

	    it 'ensures body has less than 300 characters' do
	      req = Request.new(user_id: @user.id, title: "title", body: 'a'*301, req_type: 0, lat: 39.1, lng: -9.3)	      
	      expect(req).to_not be_valid
	    end

      it 'is not valid without latitude' do
        req = Request.new(user_id: @user.id, title: "title", body: "body", req_type: 0, lat: nil, lng: -9.3)
        expect(req).to_not be_valid
      end

      it 'is not valid without longitude' do
        req = Request.new(user_id: @user.id, title: "title", body: "body", req_type: 0, lat: 39.1, lng: nil)
        expect(req).to_not be_valid
      end

      it 'is not valid without request type' do
        req = Request.new(user_id: @user.id, title: "title", body: "body", req_type: nil, lat: 39.1, lng: -9.3)
        expect(req).to_not be_valid
      end

  	end
end
