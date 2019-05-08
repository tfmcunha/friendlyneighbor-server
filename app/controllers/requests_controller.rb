class RequestsController < ApiController
	before_action :require_login
	
	def index
		requests = Request.all
		render json: {requests: requests}
	end

	def create
		request = Request.create!(request_params)
		render json: { status: :ok}

	end

	private

	def request_params
		params.require(:request).permit(:user_id, :title, :body, :req_type)
	end
end
