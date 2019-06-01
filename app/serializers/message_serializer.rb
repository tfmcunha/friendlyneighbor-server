class MessageSerializer < ActiveModel::Serializer
	attributes :id, :conversation_id, :body, :user_id, :user_name

	belongs_to :conversation

	def user_name
		object.user.first_name
	end
end
