class UserSerializer < ActiveModel::Serializer  	
	include Rails.application.routes.url_helpers
  	attributes :id, :email, :first_name, :last_name, :govidurl
  	  	
  	has_many :volunteers
  	
  	def govidurl
  		return rails_blob_path(object.govid, only_path: true)  		
  	end
end
