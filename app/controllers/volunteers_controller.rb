class VolunteersController < ApiController
	before_action :require_login
	before_action :set_volunteer

	def destroy
		@volunteer.destroy
		render json: :ok
	end

	private	

	def set_volunteer
		@volunteer = Volunteer.find(params[:id])
	end
end
