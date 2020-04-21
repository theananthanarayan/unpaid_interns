class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    # broadcast message so that all subscribers can have access to it.
    ActionCable.server.broadcast build_room_id(message.conversation_id), message: render_message(message)
  end
  
  private
    def render_message(message)
      # This is also a new feature in Rails 5. The controller renderer has been 
      # extracted from the controller instance and can now be called as a class 
      # method
      ApplicationController.renderer.render(partial: 'students/display_message', locals: { messages: message})
    end
    
  def build_room_id(id)
    "ChatRoom-#{id}"
  end
end
