class RequestSerializer < ActiveModel::Serializer
  attributes :id, :title, :req_type, :body, :lat, :lng

  belongs_to :user
  has_many :volunteers
end
