class RequestsController < ApiController
	before_action :require_login
	
	def index
		requests = Request.all
		render json: requests
	end
end
