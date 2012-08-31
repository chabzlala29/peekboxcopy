# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

#GENERAL.JS
#globals $ window document clearInterval setInterval setTimeout objMLB currentItem
$ ->
  s = null
  myTimer = null
  MLBContentslider =

  # primary namespace begins here

  # below are the variables being used in the slider
    settings:

    # below is the width of the slider, used when calculating the slide distance
      sliderWidth: $("#photo").width()

      # below is the speed of the animated slider in miliseconds
      speed: 500

      # the speed below is slightly faster for the thumbs appearance
      tspeed: 350

      # below is the time between each slide for the auto-sliding mechanism
      intervalPause: 5000

      # the variables below are just caching stuff that's reused
      photoList: $("#photo ul")
      links: $("#thumbs a, #navigation ul a")
      navLinks: $("#navigation ul a")
      spans: "#thumbs ul li a span"
      thumbLinks: $("#thumbs a")
      spanHTML: "<span></span>"
      hoverHTML: "<span class='hoverlight'></span>"
      hlClass: "highlight"
      hlLinks: "#thumbs a.highlight"
      hvLinks: "#thumbs a span.hoverlight"
      hoverBox: $("#hover-box")
      prevNext: $(".prev-next")
      playPause: $("#play-pause")
      thumbs: $("#thumbs")
      mainLink: $("#title>a")
      pnItem: 0

      # below are just initial values for later-used stuff
      marginSetting: null
      clickedURL: null
      clickedHash: null
      navURL: null
      navHash: null
      thumbsURL: null
      thumbsHash: null
      mousedURL: null
      mousedHash: null
      currentView: null
      activeItem: null


    # function to populate the data for the clicked item; data comes from file: "js/data.js"
    init: (currentItem, objMLB) ->
      s = @settings
      $("#thumbs p").html objMLB.headlineText[currentItem - 1]
      $("#long-desc").html objMLB.descText[currentItem - 1]
      $("#title>a").html objMLB.headlineText[currentItem - 1]
      $("#title>a")[0].href = objMLB.extURL[currentItem - 1]
      $("#small-caption").html objMLB.smallCaption[currentItem - 1]


    # the function below shows the thumbs for a quick second, to show the user the full interface
    showThumbs: ->
      s.thumbs.css "display", "block"
      s.thumbs.animate
        opacity: 1
        bottom: "24px"
      , s.speed, ->
        setTimeout (->
          s.thumbs.animate
            opacity: 0
            bottom: "-24px"
          , s.speed, ->
            s.thumbs.css "display", "none"

        ), 1500



    # this triggers click functionality for the thumbs and circle links
    doClick: ->
      s = @settings

      # bind a click event to the thumbnail photos and navigation links
      $(s.links).bind "click", ->
        clearInterval myTimer
        s.playPause.removeClass().addClass "play"
        $(s.spans).remove()

        # get the clicked item from the URL
        s.clickedURL = @href.toString()
        s.clickedHash = s.clickedURL.split("#")[1]

        # a previously existing highlight is removed to prevent duplicates
        $(s.links).removeClass s.hlClass

        # loop through the navigation links to highlight the clicked one
        s.navLinks.each ->
          s.navURL = @href.toString()
          s.navHash = s.navURL.split("#")[1]
          if s.clickedHash is s.navHash
            $(this).addClass s.hlClass
            $(s.spanHTML).appendTo s.hlLinks


        # loop through all thumbnails, highlight the clicked one
        s.thumbLinks.each ->
          s.thumbsURL = @href.toString()
          s.thumbsHash = s.thumbsURL.split("#")[1]
          if s.clickedHash is s.thumbsHash
            $(this).addClass s.hlClass
            $(s.spanHTML).appendTo s.hlLinks


        # if any of items 2-6 are clicked, animate the margin accordingly
        if s.clickedHash > 1
          s.marginSetting = s.sliderWidth * s.clickedHash - s.sliderWidth
          s.photoList.animate
            marginLeft: "-" + s.marginSetting + "px"
          , s.speed, ->


            # optional callback after animation completes

            # if item 1 is clicked, send the switcher back to the front (0 margin)
        else
          s.photoList.animate
            marginLeft: "0px"
          , s.speed, ->


            # optional callback after animation completes
        MLBContentslider.init s.clickedHash, objMLB
        false



    # This triggers the hover funcionality for thumbs
    doHover: ->
      s = @settings

      # create the hover effect on the thumbnails
      s.links.hover (->

        # remove highlight to prevent duplicates
        $(s.hvLinks).remove()
        $(s.spans).remove()
        $(s.hoverHTML).appendTo s.hlLinks
        s.mousedURL = @href.toString()
        s.mousedHash = s.mousedURL.split("#")[1]
        $(s.hoverHTML).appendTo "#thumbs ul li:nth-child(" + s.mousedHash + ") a"
      ), ->

        # callback executes after hover complete, so highlight is always ultimately removed
        $(s.hvLinks).remove()
        $(s.hoverHTML).appendTo s.hlLinks


      # Fade in the thumbs only when the nav bar is hovered
      # If you want the thumbs always visible, comment out these 5 lines below, and show #thumbs in CSS
      s.hoverBox.hover (->
        s.thumbs.css "display", "block"
        s.thumbs.stop().animate
          opacity: 1
          bottom: "24px"
        , s.tspeed
      ), ->

        # callback function after animation completes
        s.thumbs.stop().animate
          opacity: 0
          bottom: "0px"
        , s.tspeed, ->
          s.thumbs.css "display", "none"




    # prepare the previous/next buttons for the actions that result
    prepPreviousNext: ->
      s.prevNext.bind "click", ->
        clearInterval myTimer
        s.playPause.removeClass().addClass "play"
        s.activeItem = $("#thumbs ul li a.highlight")[0].href.split("#")[1]

        # make sure the value from the URL is a number, otherwise addition operator won't work
        s.activeItem = parseInt(s.activeItem, 10)

        # decide the prev/next item based on link ID and active item
        # this makes sure that "6" is the "previous" item in relation to "1",
        # and "1" is "next" in relation to "6"
        if $(this).attr("id") is "prev"
          if s.activeItem is 1
            s.pnItem = 6
          else
            s.pnItem = s.activeItem - 1
        else
          if s.activeItem is 6
            s.pnItem = 1
          else
            s.pnItem = s.activeItem + 1

        # remove highlight before adding the new one, to avoid duplicates
        $(s.spans).remove()
        s.links.removeClass s.hlClass
        MLBContentslider.doPreviousNext s.activeItem, s.pnItem
        false



    # below are the previous/next actions
    doPreviousNext: (activeItem, pnItem) ->
      s = @settings
      $(s.spanHTML).appendTo "#thumbs ul li:nth-child(" + s.pnItem + ") a"
      $("#thumbs ul li:nth-child(" + s.pnItem + ") a").addClass s.hlClass
      $("#navigation ul li:nth-child(" + s.pnItem + ") a").addClass s.hlClass

      # calculate the animated margins
      if s.pnItem > 1
        s.marginSetting = s.sliderWidth * s.pnItem - s.sliderWidth
        s.photoList.animate
          marginLeft: "-" + s.marginSetting + "px"
        , s.speed
      else
        s.photoList.animate
          marginLeft: "0px"
        , s.speed
      @init s.pnItem, objMLB


    # Below are the auto-run actions
    # there's probably too much repeated here from other sections, but whatever
    doAutoRun: ->
      s = @settings
      s.currentView = $(s.hlLinks)[0].href.split("#")[1]
      s.currentView = parseInt(s.currentView, 10)
      if s.currentView is 6
        s.currentView = 1
      else
        s.currentView += 1
      s.thumbLinks.removeClass()
      $(s.spans).remove()
      s.navLinks.removeClass()
      $("#thumbs ul li:nth-child(" + s.currentView + ") a").addClass s.hlClass
      $("#navigation ul li:nth-child(" + s.currentView + ") a").addClass s.hlClass
      $(s.hoverHTML).appendTo "#thumbs ul li:nth-child(" + s.currentView + ") a"
      if s.currentView > 1
        s.marginSetting = s.sliderWidth * s.currentView - s.sliderWidth
        s.photoList.animate
          marginLeft: "-" + s.marginSetting + "px"
        , s.speed
      else
        s.photoList.animate
          marginLeft: "0px"
        , s.speed
      @init s.currentView, objMLB


    # play and pause the auto-run feature
    doPlayPause: ->
      s = @settings
      s.playPause.click ->
        if $(this).hasClass("pause")
          $(this).removeClass().addClass "play"
          clearInterval myTimer
        else
          $(this).removeClass().addClass "play pause"
          clearInterval myTimer
          myTimer = setInterval(->
            MLBContentslider.doAutoRun()
          , s.intervalPause)
        false


  # primary MLBContentslider namespace ends here

  # these are the function calls to trigger all the functionality
  # I have no idea if there is a better way to do this
  MLBContentslider.init currentItem, objMLB
  MLBContentslider.showThumbs()
  MLBContentslider.doClick()
  MLBContentslider.doHover()
  MLBContentslider.prepPreviousNext()
  myTimer = setInterval(->
    MLBContentslider.doAutoRun()
  , MLBContentslider.settings.intervalPause)
  MLBContentslider.doPlayPause()





#============================================================================================
#DATA for MLB
# This section begins the data held in the "objMLB" object
# Normally, this would be in a database and would be available via Ajax or some other method


currentItem = 1
objMLB =

  headlineText: [
                  "Sony signs a contract with Peekbox",
                  "Ride with the most awesome cars Mercedes Benz has to offer!",
                  "Singsation is nearing its finals.Be a part of the event. Make sure to support your favorites.",
                  "It's so easy to join! Win a Hang-out session",
                  "It's so easy to join! Win a Hang-out session",
                  "It's so easy to join! Win a Hang-out session"]
  # headlineText
  smallCaption: ["Roy Halladay struck out 11 Marlins batters and threw 115 pitches Saturday.", "Thome had one of 20 Twins hits; Soriano, Ethier and Ramirez each drove in four runs. (AP)", "Davis yielded three hits; Carpenter fanned eight; Verlander went 8 1/3; Chacin allowed one hit. (AP)", "Ty Wigginton doubled in Nick Markakis to win it; David Murphy's sac fly put Texas on top. (AP)", "In the American League, 14 first basemen are competing to start in the 81st All-Star Game.", "MLB Network delves into the major baseball issues weeknights at 6 p.m. ET and Sundays at 5 p.m."]
  # smallCaption
  descText: ["Phillies ace Roy Halladay made history in Miami on Saturday, tossing the 20th perfect game in MLB history vs. the Marlins in a 1-0 win. It was the first no-hitter of Halladay's brilliant career.", "Jim Thome hit his 569th home run to move into a tie for 11th place all-time. Alfonso Soriano, Andre Ethier and Hanley Ramirez each hit two long balls to cap their sizzling weekends.", "Detroit's Justin Verlander, St. Louis' Chris Carpenter and Colorado's Jhoulys Chacin all threw gems Sunday. But Tampa Bay's Wade Davis outdueled Zack Greinke in a tight 1-0 win.", "Ty Wigginton's double in the 10th made the Orioles walk-off winners, 3-2, to sweep the Red Sox. The Rangers tied the Mariners in the ninth and won, 3-1, on a sac fly and passed ball in the 11th.", "The 2010 All-Star Game Sprint Online Ballot is in midseason form. Cast up to 25 ballots per email address to help choose 17 starters for the July 13 game at Angel Stadium.", "MLB Tonight is at full speed, with look-ins, analysis, news and highlights from around baseball. Tune in to MLB Network weeknights and Sundays from 5-7 p.m. ET for the action."]
  # descText
  extURL: ["#1", "#2", "#3", "#4", "#5", "#6"]
# extURL
# objMLB ends here




#===================================================================================================
jQuery(document).ready ($) ->
  $("a.iframe").fancybox
    width: "75%"
    height: "75%"
    autoScale: false
    transitionIn: "none"
    transitionOut: "none"
    type: "iframe"
    onclick: ->
        jQuery("#fancybox-wrap, #fancybox-overlay").delay(3000).fadeOut()
