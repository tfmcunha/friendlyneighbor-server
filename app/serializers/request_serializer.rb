class RequestSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :title, :req_type, :body, :lat, :lng, :user_name
  
  belongs_to :user
  has_many :volunteers

  def user_name
  	object.user.first_name+" "+object.user.last_name  	
  end
end
