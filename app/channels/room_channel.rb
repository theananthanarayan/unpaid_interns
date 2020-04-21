class RoomChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from("ChatRoom-#{(params[:convo_id])}")
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    stop_all_streams
  end

  def speak(data)
    sender_id    = data['sender_id']
    convo_id   = data['convo_id']
    content   = data['content']

    raise 'No convo_id!' if convo_id.blank?
    raise 'No sender_id' if sender_id.blank?
    convo = get_convo(convo_id) # A conversation is a room
    sender = get_sender(sender_id)
    raise 'No conversation found!' if convo.blank?
    raise 'No message!' if content.blank?
    raise 'No sender found!!!NOOOAAH' if sender.blank?

    # adds the message sender to the conversation if not already included
    convo.students << sender unless convo.users.include?(sender)
    # saves the message and its data to the DB
    # Note: this does not broadcast to the clients yet!
    Messages.create!(
      conversation_id: convo.id,
      student_id: sender.id,
      content: content
    )
  end
  def get_convo(id)
    Conversation.find(id)
  end
  
  def get_sender(id)
    Student.find(id)
  end
end
