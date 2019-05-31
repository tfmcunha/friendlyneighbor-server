class Message < ApplicationRecord
	belongs_to :user
	belongs_to :conversation

	after_save :broadcast

	def broadcast()  		
		ActionCable.server.broadcast(
            # Broadcast to user/sender private channel
            "current_user_#{self.conversation.sender_id}", 
            {messages: self.conversation.messages, id: self.conversation.id}
        )

		ActionCable.server.broadcast(
            # Broadcast to user/receiver private channel
            "current_user_#{self.conversation.recipient_id}", 
            {messages: self.conversation.messages, id: self.conversation.id}
        )
	end
end
