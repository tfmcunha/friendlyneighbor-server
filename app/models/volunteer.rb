class Volunteer < ApplicationRecord
  belongs_to :user
  belongs_to :request

  after_create :visibility

  def visibility
    if self.request.volunteers.count >= 5
    	self.request.update_attributes(:visible => false)
  	end   
  end
end
