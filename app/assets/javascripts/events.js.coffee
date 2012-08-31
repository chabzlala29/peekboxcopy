# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $("#pikame").PikaChoose()

$ ->
  $(".pika-thumbs2 li").hover (->
    $(this).stop().animate
      width: "160px"
    ,
      queue: false
      duration: 200

  ), ->
    $(this).stop().animate
      width: "160px"
    ,
      queue: false
      duration: 200










