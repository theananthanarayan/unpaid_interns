class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel-#{params[:convo_id]}"
  end  
  
  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    Message.create! content: data['content'],student_id: data['student_id'],conversation_id: data['conversation_id']
  end
end
