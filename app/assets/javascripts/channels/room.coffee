App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    $('.chat-container-' + (data.user_id).toString() + ' .chat-messages').append "<div class='chat-content'>" + 
    	"<img src='/assets/vau-cde42f7c479390b9d36bc4c2263483fe29711cd5eeb7da8e361266dcc7fc32ec.JPG'/ alt='vau'>" + 
    	"<span>" + data.friend_name + "</span><div>" +	data.content + "</div><p></p></div>"

    $('.chat-messages').scrollTop($('.chat-messages')[0].scrollHeight)	

		$(document).on 'turbolinks:load', ->
			sendMessage()
			scrollBottom()
			
		sendMessage = () ->
			$('textarea').on 'keydown', (event) ->
				if event.keyCode is 13
					event.preventDefault()
					$('.send-message-button').click()
					event.target.value = ""
					# Turbolinks.visit('/', action: 'replace')

				if (event.ctrlKey or event.metaKey) and event.keyCode is 13
					txt = $('textarea')
					$('textarea').val(txt.val() + "\n")

		scrollBottom = () ->
			$('.chat-messages').scrollTop($('.chat-messages')[0].scrollHeight)