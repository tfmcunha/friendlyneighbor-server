class RequestsController < ApiController
	before_action :require_login
	
	def index
		@requests = Request.where("user_id != ?", current_user.id)
		#requests = Request.search(request.headers(:min_lat, :max_lat, :min_lng, :max_lng))
		render json: @requests 
		#render json: { requests: requests.as_json( include: { user: { only: [ :first_name, :last_name ] } } ) }
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
