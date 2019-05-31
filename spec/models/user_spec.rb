require 'rails_helper'

RSpec.describe User, type: :model do
  	context 'validations' do
  		it 'should save sucessfully' do
  			@file = fixture_file_upload(Rails.root.join('public', 'teste.png'), 'image/png')
  			@test_user = User.new(email: "teste@teste.pt", password: "123", first_name: "Tiago", last_name: "Cunha", govid: @file).save
  			expect(@test_user).to eq(true)
  		end

  		it 'ensures email format' do
	      user = User.new(email: "teste@teste.pt")
	      expect(user.email).to match(/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i)
	    end

  		it 'email already exists' do   			
  			user2 = User.new(email: "teste@teste.pt", password: "123", first_name: "Tiago", last_name: "Cunha", govid: @file).save
  			expect(user2).to eq(false)
  		end  		

  		it 'is not valid without first name' do
  			user = User.new(email: "teste@teste.pt", password: "123", first_name: nil, last_name: "Cunha", govid: @file)
  			expect(user).not_to be_valid
  		end

  		it 'is not valid without last name' do
  			user = User.new(email: "teste@teste.pt", password: "123", first_name: "Tiago", last_name: nil, govid: @file)
  			expect(user).not_to be_valid
  		end

  		it 'is not valid without password' do
  			user = User.new(email: "teste@teste.pt", password: nil, first_name: "Tiago", last_name: "Cunha", govid: @file)
  			expect(user).not_to be_valid
  		end

  		it 'is not valid without government id file' do
  			user = User.new(email: "teste@teste.pt", password: "123", first_name: "Tiago", last_name: "Cunha", govid: nil)
  			expect(user).not_to be_valid
  		end

  	end
end
