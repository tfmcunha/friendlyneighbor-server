class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)    
    broadcast(message)
  end

  private

  def broadcast(message)
    outbound = ActiveModelSerializers::SerializableResource.new(message)
    ActionCable.server.broadcast(
      "conversation_#{message.conversation_id}", { message: outbound }
    )
    ActionCable.server.broadcast("Request_#{message.conversation.request_id}", {
      conversation_id: message.conversation_id, 
      user_id: message.user_id, 
      username: "#{message.user.first_name} #{message.user.last_name}" }
    )
  end
end
