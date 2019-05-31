class RequestSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :title, :req_type, :body, :lat, :lng
  
  belongs_to :user
  has_many :volunteers
end
