require 'rails_helper'

RSpec.describe "Messages", type: :request do
  describe "POST /messages" do
    it "creates a new message and queues MessageBroadcastJob" do      

      file = fixture_file_upload(Rails.root.join('public', 'teste.png'), 'image/png')
  	  
  	  user2 = User.create!(email: "teste2@teste.pt", password: "123", first_name: "Tiago", last_name: "Cunha", govid: file)
  	  user4 = User.create!(email: "teste4@teste.pt", password: "123", first_name: "Tiago", last_name: "Cunha", govid: file)

  	  req = Request.create!(user_id: user4.id, title: "title", body:"body", req_type: "Task", lat: 39.1, lng: -9.3)

      conversation = Conversation.create!(request_id: req.id, sender_id: user2.id, recipient_id: user4.id)

      post "/messages", params: {message: {conversation_id: conversation.id, user_id: user2.id, body: "hello"}}

      expect(response).to have_http_status(:ok)
      expect(MessageBroadcastJob).to have_been_enqueued
    end
  end
end
