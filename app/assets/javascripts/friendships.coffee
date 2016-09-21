# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->

	addFriendBlock = () -> 
		$('.fa-plus').on "click", () ->
			$('.add-friend').removeClass("none-block").addClass("block")
				
	$('.add-friend').draggable(
		{
			containment: "body",
			scroll: false
		})

	$('.fa-times-circle').on "click", ->
		$('.add-friend').removeClass("block").addClass("none-block")

	clickToFindFriend = () ->
		$('.search-button').on "click", ->
			search = $('.search-box').val()
			$.ajax({
				type: "GET",
				url: "/search",
				data: { search: search},
				success: (data) ->
					$('.results').html('')
					$('.add-friend').css("height": "140px")
					resultsBlock = showFriend(data)
					$('.results').append(resultsBlock)
					clickToAddFriend(data.id)
				error: (data) ->
					console.log data
			})

	showFriend = (data) ->
		"<div class='right-results'><img src='/assets/vau-cde42f7c479390b9d36bc4c2263483fe29711cd5eeb7da8e361266dcc7fc32ec.JPG' alt='vau'><span>" + data.name + "</span><button class='add-button'>Add</button></div>"

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

	addFriendBlock()
	clickToFindFriend()
	