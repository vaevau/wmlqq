App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    console.log data.friend_id
    $('.chat-container-' + (data.friend_id).toString() + ' .chat-messages').append "<div class='p-self'>" + 
    	"<img src='/assets/vau-cde42f7c479390b9d36bc4c2263483fe29711cd5eeb7da8e361266dcc7fc32ec.JPG'/><div>" +
    	data.content + "</div></div>"
			
		$(document).on 'turbolinks:load', ->
			sendMessage()
			
		sendMessage = () ->
			$('textarea').on 'keydown', (event) ->
				if event.keyCode is 13
					event.preventDefault()
					$('.send-message-button').click()
					# Turbolinks.visit('/', action: 'replace')

				if (event.ctrlKey or event.metaKey) and event.keyCode is 13
					txt = $('textarea')
					$('textarea').val(txt.val() + "\n")

			