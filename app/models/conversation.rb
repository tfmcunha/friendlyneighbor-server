class Conversation < ApplicationRecord
	has_many :messages, :dependent => :delete_all  
	belongs_to :request
  	belongs_to :sender, foreign_key: "sender_id", class_name: "User"
 	belongs_to :recipient, foreign_key: "recipient_id", class_name: "User"

 	after_create :alertNewConversation

 	def alertNewConversation  	
	  	ActionCable.server.broadcast("Request_#{self.request_id}", {
	    	conversation_id: self.id,
	    	username: "#{self.sender.first_name} #{self.sender.last_name}",   	
	    	user_id: self.sender_id
	    	})
  	end
end
