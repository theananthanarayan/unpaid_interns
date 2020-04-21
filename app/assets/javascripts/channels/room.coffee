App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    #console.log("Room-#{gon.convo_id}")
    # Called when the subscription is ready on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called after the server has received and processed the message
    # The line below appends the new message to other messages
    console.log("RECIEVED")
    $('#message').append(data['message'])

  speak: (message) ->
    console.log("STARTING SEND")
    @perform 'speak', message
    console.log("ENDING SEND")


$(document).on 'keypress', '#room_speaker', (event) ->
  if event.keyCode is 13 # return = send
    # Call speak from the method defined above
    App.room.speak  { content: event.target.value,student_id: 1,conversation_id: 1 }
    # Set input to be empty after the message gets to the server
    event.target.value = ''
    # Prevent form from reloading
    event.preventDefault()

console.log("STARTING")