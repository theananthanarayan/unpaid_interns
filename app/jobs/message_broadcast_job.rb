class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    payload = {
      convo_id: message.conversation_id,
      content: message.content,
      sender_id: message.student_id,
      #participants: message.conversation.users.collect(&:id)
    }
    ActionCable.server.broadcast(build_room_id(message.conversation.id), payload)
  end
  
  def build_room_id(id)
    "ChatRoom-#{id}"
  end
end
