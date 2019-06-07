require 'rails_helper'

RSpec.describe "Messages", type: :request do
  describe "POST /messages" do
    it "creates a new message and queues MessageBroadcastJob" do
      conversation = Conversation.create!(request_id: 1, sender_id: 2, recipient_id: 4)
      
      post "/messages", params: {message: {conversation_id: conversation.id, user_id: 2, body: "hello"}}
      expect(response).to have_http_status(:ok)
      expect(MessageBroadcastJob).to have_been_enqueued
    end
  end
end
