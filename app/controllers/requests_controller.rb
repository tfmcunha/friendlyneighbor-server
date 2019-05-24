class RequestsController < ApiController
	before_action :require_login
	
	def index
		@requests = Request.search(request.headers[:lat], request.headers[:lng]).where("user_id != ?", current_user.id).unfulfilled.visible
		render json: @requests 		
	end

	def owner
		requests = Request.where("user_id = ?", current_user.id)
		render json: requests
	end

	def create
		request = Request.create!(request_params)
		render json: { status: :ok}
	end

	private	

	def request_params
		params.require(:request).permit(:user_id, :title, :body, :req_type, :lat, :lng)
	end

end
