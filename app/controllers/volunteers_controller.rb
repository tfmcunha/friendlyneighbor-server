class VolunteersController < ApiController
	before_action :require_login
	before_action :set_volunteer, only: [:destroy]

	def create		
		request = Request.find(volunteer_params[:request_id])

		volunteer = Volunteer.where(request_id: request.id, user_id:volunteer_params[:user_id])

		users = [volunteer_params[:user_id], request.user_id]
		
		conversation = Conversation.where({request_id: volunteer_params[:request_id]}).where({sender_id: [users]}).where({recipient_id: [users]})       

		unless volunteer.exists?
			Volunteer.create(volunteer_params)
			unless conversation.exists?
				conversation = Conversation.create!(request_id: request.id, sender_id: volunteer_params[:user_id], recipient_id: request.user_id)
				render json: conversation	
			else
				render json: conversation	
			end
		else
			render json: conversation.first
		end
		
	end	

	def destroy
		@volunteer.destroy
		render json: {status: :created}	
	end

	private	

	def set_volunteer
		@volunteer = Volunteer.find(params[:id])
	end

	def volunteer_params
        params.require(:volunteer).permit(:request_id, :user_id)
    end
end
