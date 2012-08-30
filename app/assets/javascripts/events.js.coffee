# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $("#pikame").PikaChoose()



#################################################################################
#
# * TipTip
# * Copyright 2010 Drew Wilson
# * www.drewwilson.com
# * code.drewwilson.com/entry/tiptip-jquery-plugin
# *
# * Version 1.3   -   Updated: Mar. 23, 2010
# *
# * This Plug-In will create a custom tooltip to replace the default
# * browser tooltip. It is extremely lightweight and very smart in
# * that it detects the edges of the browser window and will make sure
# * the tooltip stays within the current window size. As a result the
# * tooltip will adjust itself to be displayed above, below, to the left
# * or to the right depending on what is necessary to stay within the
# * browser window. It is completely customizable as well via CSS.
# *
# * This TipTip jQuery plug-in is dual licensed under the MIT and GPL licenses:
# *   http://www.opensource.org/licenses/mit-license.php
# *   http://www.gnu.org/licenses/gpl.html
#
(($) ->
  $.fn.tipTip = (options) ->
    defaults =
      activation: "hover"
      keepAlive: false
      maxWidth: "200px"
      edgeOffset: 3
      defaultPosition: "top"
      delay: 400
      fadeIn: 200
      fadeOut: 200
      attribute: "title"
      content: false # HTML or String to fill TipTIp with
      enter: ->

      exit: ->

    opts = $.extend(defaults, options)

    # Setup tip tip elements and render them to the DOM
    if $("#tiptip_holder").length <= 0
      tiptip_holder = $("<div id=\"tiptip_holder\" style=\"max-width:" + opts.maxWidth + ";\"></div>")
      tiptip_content = $("<div id=\"tiptip_content\"></div>")
      tiptip_arrow = $("<div id=\"tiptip_arrow\"></div>")
      $("body").append tiptip_holder.html(tiptip_content).prepend(tiptip_arrow.html("<div id=\"tiptip_arrow_inner\"></div>"))
    else
      tiptip_holder = $("#tiptip_holder")
      tiptip_content = $("#tiptip_content")
      tiptip_arrow = $("#tiptip_arrow")
    @each ->
      org_elem = $(this)
      if opts.content
        org_title = opts.content
      else
        org_title = org_elem.attr(opts.attribute)
      unless org_title is ""
        #remove original Attribute
        active_tiptip = ->
          opts.enter.call this
          tiptip_content.html org_title
          tiptip_holder.hide().removeAttr("class").css "margin", "0"
          tiptip_arrow.removeAttr "style"
          top = parseInt(org_elem.offset()["top"])
          left = parseInt(org_elem.offset()["left"])
          org_width = parseInt(org_elem.outerWidth())
          org_height = parseInt(org_elem.outerHeight())
          tip_w = tiptip_holder.outerWidth()
          tip_h = tiptip_holder.outerHeight()
          w_compare = Math.round((org_width - tip_w) / 2)
          h_compare = Math.round((org_height - tip_h) / 2)
          marg_left = Math.round(left + w_compare)
          marg_top = Math.round(top + org_height + opts.edgeOffset)
          t_class = ""
          arrow_top = ""
          arrow_left = Math.round(tip_w - 12) / 2
          if opts.defaultPosition is "bottom"
            t_class = "_bottom"
          else if opts.defaultPosition is "top"
            t_class = "_top"
          else if opts.defaultPosition is "left"
            t_class = "_left"
          else t_class = "_right"  if opts.defaultPosition is "right"
          right_compare = (w_compare + left) < parseInt($(window).scrollLeft())
          left_compare = (tip_w + left) > parseInt($(window).width())
          if (right_compare and w_compare < 0) or (t_class is "_right" and not left_compare) or (t_class is "_left" and left < (tip_w + opts.edgeOffset + 5))
            t_class = "_right"
            arrow_top = Math.round(tip_h - 13) / 2
            arrow_left = -12
            marg_left = Math.round(left + org_width + opts.edgeOffset)
            marg_top = Math.round(top + h_compare)
          else if (left_compare and w_compare < 0) or (t_class is "_left" and not right_compare)
            t_class = "_left"
            arrow_top = Math.round(tip_h - 13) / 2
            arrow_left = Math.round(tip_w)
            marg_left = Math.round(left - (tip_w + opts.edgeOffset + 5))
            marg_top = Math.round(top + h_compare)
          top_compare = (top + org_height + opts.edgeOffset + tip_h + 8) > parseInt($(window).height() + $(window).scrollTop())
          bottom_compare = ((top + org_height) - (opts.edgeOffset + tip_h + 8)) < 0
          if top_compare or (t_class is "_bottom" and top_compare) or (t_class is "_top" and not bottom_compare)
            if t_class is "_top" or t_class is "_bottom"
              t_class = "_top"
            else
              t_class = t_class + "_top"
            arrow_top = tip_h
            marg_top = Math.round(top - (tip_h + 5 + opts.edgeOffset))
          else if bottom_compare | (t_class is "_top" and bottom_compare) or (t_class is "_bottom" and not top_compare)
            if t_class is "_top" or t_class is "_bottom"
              t_class = "_bottom"
            else
              t_class = t_class + "_bottom"
            arrow_top = -12
            marg_top = Math.round(top + org_height + opts.edgeOffset)
          if t_class is "_right_top" or t_class is "_left_top"
            marg_top = marg_top + 5
          else marg_top = marg_top - 5  if t_class is "_right_bottom" or t_class is "_left_bottom"
          marg_left = marg_left + 5  if t_class is "_left_top" or t_class is "_left_bottom"
          tiptip_arrow.css
            "margin-left": arrow_left + "px"
            "margin-top": arrow_top + "px"

          tiptip_holder.css(
            "margin-left": marg_left + "px"
            "margin-top": marg_top + "px"
          ).attr "class", "tip" + t_class
          clearTimeout timeout  if timeout
          timeout = setTimeout(->
            tiptip_holder.stop(true, true).fadeIn opts.fadeIn
          , opts.delay)
        deactive_tiptip = ->
          opts.exit.call this
          clearTimeout timeout  if timeout
          tiptip_holder.fadeOut opts.fadeOut
        org_elem.removeAttr opts.attribute  unless opts.content
        timeout = false
        if opts.activation is "hover"
          org_elem.hover (->
            active_tiptip()
          ), ->
            deactive_tiptip()  unless opts.keepAlive

          if opts.keepAlive
            tiptip_holder.hover (->
            ), ->
              deactive_tiptip()

        else if opts.activation is "focus"
          org_elem.focus(->
            active_tiptip()
          ).blur ->
            deactive_tiptip()

        else if opts.activation is "click"
          org_elem.click(->
            active_tiptip()
            false
          ).hover (->
          ), ->
            deactive_tiptip()  unless opts.keepAlive

          if opts.keepAlive
            tiptip_holder.hover (->
            ), ->
              deactive_tiptip()


) jQuery


##########################################################
$ ->
  $(".someClass").tipTip()




