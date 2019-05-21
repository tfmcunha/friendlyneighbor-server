class VolunteerSerializer < ActiveModel::Serializer
  attributes :id, :username
  
  belongs_to :user

  def username
  	object.user.first_name+" "+object.user.last_name
  end
end
