class RequestsController < ApiController
	before_action :require_login
	before_action :set_request, only: [:update]
	
	def index
		@requests = Request.search(request.headers[:lat], request.headers[:lng]).where("user_id != ?", current_user.id).unfulfilled.isVisible
		render json: @requests 		
	end

	def owner
		requests = Request.where("user_id = ?", current_user.id)
		isVolunteer = Request.unfulfilled.joins(:volunteers).where(volunteers: {user_id: current_user.id})
		render json: {requests: ActiveModelSerializers::SerializableResource.new(requests),
					isVolunteer: ActiveModelSerializers::SerializableResource.new(isVolunteer)}

	end

	def create
		request = Request.create!(request_params)
		render json: { status: :ok}
	end

	def update		
		@request.update_attributes(request_params)
		render json: { status: :ok}
	end

	private	

	def set_request
		@request = Request.find(params[:id])
	end

	def request_params
		params.require(:request).permit(:user_id, :title, :body, :req_type, :lat, :lng, :fulfilled)
	end

end
