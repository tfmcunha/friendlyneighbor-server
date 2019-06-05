class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)    
    broadcast(message)
  end

  private

  def broadcast(message)
    outbound = ActiveModelSerializers::SerializableResource.new(message)
    ActionCable.server.broadcast(
      "conversation_#{message.conversation_id}", { message: outbound, id: message.conversation_id}
    )
  end
end
