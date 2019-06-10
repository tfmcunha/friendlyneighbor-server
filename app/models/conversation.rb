class Conversation < ApplicationRecord
	has_many :messages, :dependent => :delete_all  
	belongs_to :request
  	belongs_to :sender, foreign_key: "sender_id", class_name: "User"
 	belongs_to :recipient, foreign_key: "recipient_id", class_name: "User"

end
