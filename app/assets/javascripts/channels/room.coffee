App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel

    # $('.chat-container-' + data.friend_id '.chat-messages').append("<div class='p-self'><div>" + data.content + "</div><img src='/assets/vau-cde42f7c479390b9d36bc4c2263483fe29711cd5eeb7da8e361266dcc7fc32ec.JPG'/></div>")
			
		$(document).on 'turbolinks:load', ->
			sendMessage()
			
		sendMessage = () ->
			$('#message_content').on 'keydown', (event) ->
				if event.keyCode is 13
					event.preventDefault()
					$('.send-message-button').click()
					Turbolinks.visit('/', action: 'replace')

				if (event.ctrlKey or event.metaKey) and event.keyCode is 13
					txt = $('textarea')
					$('textarea').val(txt.val() + "\n")

			