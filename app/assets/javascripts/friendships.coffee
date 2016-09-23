# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->

	addFriendBlock = () -> 
		$('.fa-plus').on "click", () ->
			$('.results').html('')
			$('.add-friend').removeClass("none-block").addClass("block")
				
	$('.add-friend').draggable(
		{
			containment: "body",
			scroll: false
		})

	$('.fa-times-circle').on "click", ->
		$('.add-friend').removeClass("block").addClass("none-block")
		$('.search-box').val('')

	clickToFindFriend = () ->
		$('.search-button').on "click", ->
			search = $('.search-box').val()
			$.ajax({
				type: "GET",
				url: "/search",
				data: { search: search},
				success: (data) ->
					$('.results').html('')
					resultsBlock = showFriend(data)
					if data.error_message is undefined
						$('.add-friend').css("height": "140px")
						$('.results').append(resultsBlock)
						clickToAddFriend(data.id)
					else
						$('.add-friend').css("height": "100px")
						$('.results').append(resultsBlock)
				error: (data) ->

			})

	showFriend = (data) ->
		if data.error_message is undefined
			"<div class='right-results'><img src='/assets/vau-cde42f7c479390b9d36bc4c2263483fe29711cd5eeb7da8e361266dcc7fc32ec.JPG' alt='vau'><span>" + data.name + "</span><button class='add-button'>Add</button></div>"
		else
			"<div class='error-results'>" + data.error_message + "</div>"

	clickToAddFriend = (friend_id) ->
		$('.add-button').on "click", ->
			$.ajax({
				type: "POST",
				url: "/friendships",
				data: {friend_id: friend_id},
				success: (data) ->
					$('.results').html(data.data)
					Turbolinks.visit("/home")
				error: (data) ->
					$('.results').html(data.data)
			})

	clickToTalk = () ->
		$('.chat-p').on "click", ->
			$(this).css("background-color": "#bbc1c1")
			$('.chat-p').not(this).css("background-color": "#dfe4e4")

			classNames = $(this).attr('class').split(' ')
			pIdArr = classNames[classNames.length - 1].split('-')
			pId = pIdArr[pIdArr.length - 1]

			$('.chat .none-block').hide()
			$('.chat-container-' + pId).show()

			$('textarea').focus()

	addFriendBlock()
	clickToFindFriend()
	clickToTalk()
	