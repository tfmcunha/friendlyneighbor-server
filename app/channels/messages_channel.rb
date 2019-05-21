class MessagesChannel < ApplicationCable::Channel
  def subscribed
  	conversation = Conversation.find(id=1)
    stream_for conversation
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
