class Request < ApplicationRecord
  belongs_to :user
  has_many :volunteers, :dependent => :delete_all  #falta migrar para db

  validates_presence_of :title, :body, :req_type
end
