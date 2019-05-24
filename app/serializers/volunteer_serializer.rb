class VolunteerSerializer < ActiveModel::Serializer
  attributes :request_id, :username, :owner
  
  belongs_to :user
  has_many :request

  def username
  	object.user.first_name+" "+object.user.last_name
  end

  def owner
  	req = Request.find_by_id(object.request_id)
  	req.user.first_name+" "+req.user.last_name
  end
end
