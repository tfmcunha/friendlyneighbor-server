class ConversationsController < ApiController

	def create

        users = [conversation_params[:recipient_id], conversation_params[:sender_id]]
        conversation = Conversation.where({request_id: conversation_params[:request_id]}).where({sender_id: [users]}).where({recipient_id: [users]}).first       
        
        request = Request.find(conversation_params[:request_id])

        if conversation_params[:recipient_id] != conversation_params[:sender_id]  
            if conversation != nil             
                render json: conversation
            else
                conversation = Conversation.create!(conversation_params)   
                Volunteer.create(user_id: conversation_params[:sender_id], request_id: conversation_params[:request_id])
                render json: conversation
            end
        end
    end



    private
  
    def conversation_params
        params.require(:conversation).permit(:request_id, :sender_id, :recipient_id)
    end

end
