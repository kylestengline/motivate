App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    $('#messages').scrollTop(9999999);
    $(document).on 'keypress', '[data-behavior~=room_speaker]', (event) =>
	    if event.keyCode is 13 # return = send
	    	input_user = $('#user')
	    	user = "Guest"
	    	if input_user.val() != ""
	      	user = input_user.val()
	    	@speak event.target.value, user
	    	# "#{user}: #{event.target.value}"
	    	# may have to comment this out. Empties the user name field once you hit enter. 
	    	input_user.val('')
	    	event.target.value = ''
	    	event.preventDefault()

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('#messages').append(data['message']).scrollTop(9999999);

  speak: (message,user) ->
    @perform 'speak', message: message, user: user

