class ConversationsController < ApiController
	#before_action :require_login	

	def getconversation     
		conversation = Conversation.where({request_id: request.headers[ :request ]}).where({sender_id: request.headers[ :sender ]}).first 	
		if conversation == nil
			render json: {message: "not found"}
        else
        	render json: conversation
        end
    end
end
