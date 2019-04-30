class RequestsController < ApiController
	before_action :require_login
	
	def index
		requests = Request.all
		render json: requests
	end

	def create
		request.create!(request_params)
	end

	private

	def request_params
		params.require(:request).permit(:title, :body, :type, :fulfilled)
	end
end
