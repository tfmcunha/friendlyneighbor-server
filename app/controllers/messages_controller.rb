class MessagesController < ApplicationController
	def create
		message = Message.new(message_params)
		conversation = Conversation.find(message_params[:conversation_id])
		if message.save

			ActionCable.server.broadcast(
                # Broadcast to user/sender private channel
                "current_user_#{conversation.sender_id}", 
                conversation.messages
                
            )

            ActionCable.server.broadcast(
                # Broadcast to user/receiver private channel
                "current_user_#{conversation.recipient_id}", 
                conversation.messages
            )

			render json: { status: :ok }
		end
	end

	private

	def message_params
		params.require(:message).permit(:body, :user_id, :conversation_id )
	end
end
