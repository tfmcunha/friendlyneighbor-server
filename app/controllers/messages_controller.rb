class MessagesController < ApiController

	#before_action :require_login
	
	
	def create
		Message.create(message_params)
		render json: {status: :created}	
	end

	private

	def message_params
		params.require(:message).permit(:body, :user_id, :conversation_id )
	end
end
