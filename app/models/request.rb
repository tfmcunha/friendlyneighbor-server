class Request < ApplicationRecord
  belongs_to :user
  has_many :volunteers, :dependent => :delete_all   
  has_many :conversations, :dependent => :delete_all 

  validates_presence_of :title, :body, :req_type

  scope :by_lat, -> (min, max) { min && max ? where('lat >= :min AND lat <= :max', min: min, max: max) : all }
  scope :by_lng, -> (min, max) { min && max ? where('lng >= :min AND lng <= :max', min: min, max: max) : all }

  def self.search(min_lat, max_lat, min_lng, max_lng)
  	by_lat(min_lat, max_lat)
  		by_lng(min_lng, max_lng)

  end
end
