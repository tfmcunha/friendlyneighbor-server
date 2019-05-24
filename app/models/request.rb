class Request < ApplicationRecord
  belongs_to :user
  has_many :volunteers, :dependent => :delete_all   
  has_many :conversations, :dependent => :delete_all 

  validates_presence_of :title, :body, :req_type

  scope :bounds, -> (min_lat, max_lat, min_lng, max_lng) { min_lat && max_lat && min_lng && max_lng ? where('lat >= :min_lat AND lat <= :max_lat AND lng >= :min_lng AND lng <= :max_lng', min_lat: min_lat, max_lat: max_lat, min_lng: min_lng, max_lng: max_lng) : all }
  
  def self.search(lat, lng)
    rad = 0.009 #0.009 = 1km
    lat = lat.to_f
    lng = lng.to_f
    min_lat = lat - rad
    max_lat = lat + rad
    min_lng = lng - rad
    max_lng = lng + rad

    bounds(min_lat, max_lat, min_lng, max_lng)

  end

  def self.visible 
    where(visible: true)
  end

  def self.unfulfilled
    where(fulfilled: false)
  end

  def visibility
    if self.volunteers.count >= 5
      update_attributes(:visible => false)
    end   
  end
end

