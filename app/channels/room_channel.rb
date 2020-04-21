class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
  end  
  
  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)#message is a 
    #Message.create! content: data['content'],student_id: data['student_id'],conversation_id: data['conversation_id']
    Message.create! content: data['content'],student_id: 1,conversation_id: 1
  end
end
