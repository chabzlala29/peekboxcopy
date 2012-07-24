# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ -> 
	$("#media-btn").bind 'click', -> 
		$("#user-page-wall-post").hide()	
		$("#user-page-media").slideDown('slow')
		$("#media-btn").addClass('user-page-selected')
		$("#wall-btn").removeClass('user-page-selected')

	$("#wall-btn").bind 'click', -> 
		$("#user-page-wall-post").slideDown('slow')	
		$("#user-page-media").hide()
		$("#wall-btn").addClass('user-page-selected')
		$("#media-btn").removeClass('user-page-selected')
