class Message < ApplicationRecord
	belongs_to :user
	belongs_to :conversation

	after_save :broadcast

	def broadcast()  	
    ActionCable.server.broadcast(
            # Broadcast to user/sender private channel
            "conversation_#{self.conversation.id}", 
            self.conversation.messages
        )

		
	end
end


# Create our resource
#post = Post.create(title: "Sample post", body: "I love Active Model Serializers!")

# Optional options parameters for both the serializer and instance
#options = {serializer: PostDetailedSerializer, username: 'sample user'}

# Create a serializable resource instance
#serializable_resource = ActiveModelSerializers::SerializableResource.new(post, options)

# Convert your resource into json
#model_json = serializable_resource.as_json