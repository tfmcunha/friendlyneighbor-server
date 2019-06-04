class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(conversation_id)
    conversation = Conversation.find(conversation_id)
    broadcast(conversation)
  end

  private

  def broadcast(conversation)
    ActionCable.server.broadcast(
      "conversation_#{conversation.id}",
      {messages: ActiveModelSerializers::SerializableResource.new(conversation.messages), id: conversation.id}
    )
  end
end
