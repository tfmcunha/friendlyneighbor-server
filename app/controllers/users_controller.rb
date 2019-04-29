class UsersController < ApiController
	before_action :require_login, except: [ :create ]

	def create
		user = User.create!(user_params)
		render json: {token: user.auth_token}
		
		rescue ActiveRecord::RecordInvalid => exception
			render json: { errors: exception.record.errors } 
			

	end

	def profile
		user = User.find_by_auth_token!(request.headers[ :token ])
		render json: { user: { id: user.id, email: user.email, first_name: user.first_name, last_name: user.last_name, govid: url_for(user.govid), requests: user.requests }}
	end

	def destroy
		user = User.find_by_auth_token!(request.headers[ :token ])
    	user.destroy
    	render json: { status: :ok }
  	end

	private

	def user_params
		params.require(:user).permit( :email, :password, :first_name, :last_name, :govid)
	end	
end
