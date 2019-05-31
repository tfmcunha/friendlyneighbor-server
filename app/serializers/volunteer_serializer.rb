class VolunteerSerializer < ActiveModel::Serializer
  attributes :id, :request_id, :user_id, :username, :owner
  
  belongs_to :user
  belongs_to :request

  def username
  	object.user.first_name+" "+object.user.last_name
  end

  def owner
  	req = Request.find_by_id(object.request_id)
  	req.user.first_name+" "+req.user.last_name
  end
end
