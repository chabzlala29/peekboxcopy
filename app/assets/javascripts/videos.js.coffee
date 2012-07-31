# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$j = jQuery

playCount = 0
playAds = true
ads = "https://peekbox.s3.amazonaws.com/uploads/video/media/4/video.mp4"
currentVideo = null
$j ->
	ads = $('#video-element').attr 'ads'

	$('#video-element').bind 'play', ->
		if playAds == true
			currentVideo = this.src
			this.src = ads 
			this.play()
			playAds = false

	$('#video-element').bind 'ended', ->
		if playCount < 1
			this.src = currentVideo
			this.play()
			playCount++

switchTo5x = true
