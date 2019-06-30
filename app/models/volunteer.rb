class Volunteer < ApplicationRecord
  belongs_to :user
  belongs_to :request

  after_create :visibility  
  after_create :alertNewVolunteer

  def visibility
    if self.request.volunteers.count >= 5
    	self.request.update_attributes(:visible => false)
    	VisibilityJob.set(wait: 24.hour).perform_later(self)
  	end   
  end

  def alertNewVolunteer    
      ActionCable.server.broadcast("Request_#{self.request_id}", {        
        username: "#{self.user.first_name} #{self.user.last_name}",     
        user_id: self.user_id
        })
    end
  
end
