class RequestsController < ApiController
	skip_before_action :require_login, only: [ :count ], raise: false
	before_action :set_request, only: [:update]
	
	def index
		@requests = Request.search(request.headers[:lat], request.headers[:lng]).where("user_id != ?", current_user.id).unfulfilled.isVisible
		render json: @requests 				
	end

	def owner
		requests = Request.where("user_id = ?", current_user.id).unfulfilled
		isVolunteer = Request.unfulfilled.joins(:volunteers).where(volunteers: {user_id: current_user.id})
		render json: {requests: ActiveModelSerializers::SerializableResource.new(requests),
					isVolunteer: ActiveModelSerializers::SerializableResource.new(isVolunteer)}
	end

	def count
		count = Request.unfulfilled.count
		render json: count
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
