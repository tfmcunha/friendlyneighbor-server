class Volunteer < ApplicationRecord
  belongs_to :user
  belongs_to :request

  after_create :visibility

  def visibility
    if self.request.volunteers.count >= 5
    	self.request.update_attributes(:visible => false)
    	VisibilityJob.set(wait: 24.hour).perform_later(self)
  	end   
  end
end
