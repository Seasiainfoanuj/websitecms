color_green = "#27cebc"
color_blue = "#00acec"
color_yellow = "#FDD01C"
color_red = "#f35958"
color_grey = "#dce0e8"
color_black = "#1b1e24"
color_purple = "#6d5eac"
color_primary = "#6d5eac"
color_success = "#4eb2f5"
color_danger = "#f35958"
color_warning = "#f7cf5e"
color_info = "#3b4751"

calculateHeight = ->
  contentHeight = parseInt($(".page-content").height(), 10)
  return

toggleMainMenu = ->
  timer = undefined

  if $("body").hasClass("open-menu-left")
    $("body").removeClass "open-menu-left"
    timer = setTimeout(->
      $(".page-sidebar").removeClass "visible"
      return
    , 300)
  else
    clearTimeout timer
    $(".page-sidebar").addClass "visible"
    setTimeout (->
      $("body").addClass "open-menu-left"
      return
    ), 50
  return

toggleChat = ->
  timer = undefined
  if $("body").hasClass("open-menu-right")
    $("body").removeClass "open-menu-right"
    timer = setTimeout(->
      $(".chat-window-wrapper").removeClass "visible"
      return
    , 300)
  else
    clearTimeout timer
    $(".chat-window-wrapper").addClass "visible"
    $("body").addClass "open-menu-right"
  return

blockUI = (el) ->
  $(el).block
    message: "<div class=\"loading-animator\"></div>"
    css:
      border: "none"
      padding: "2px"
      backgroundColor: "none"

    overlayCSS:
      backgroundColor: "#fff"
      opacity: 0.3
      cursor: "wait"

  return

# wrapper function to  un-block element(finish loading)
unblockUI = (el) ->
  $(el).unblock()
  return

ready = ->
  equalHeight = (group) ->
    tallest = 0
    group.each ->
      thisHeight = $(this).height()
      tallest = thisHeight  if thisHeight > tallest
      return

    group.height tallest
    return
  initMainMenu = ->
  initExtendedLayoutMenuScroll = ->
  closeAndRestSider = ->
    if $("#main-menu").attr("data-inner-menu") is "1"
      $("#main-menu").addClass "mini"
      $("#main-menu").removeClass "left"
    else
      $("#main-menu").removeClass "left"
    return
  rebuildSider = ->
  calculateHeight()
  $(".remove-widget").click ->
    $(this).parent().parent().parent().addClass "animated fadeOut"
    $(this).parent().parent().parent().attr "id", "id_a"
    setTimeout (->
      $("#id_a").remove()
      return
    ), 400
    false

  $(".create-folder").click ->
    $(".folder-input").show()
    false

  $(".folder-name").keypress (e) ->
    if e.which is 13
      $(".folder-input").hide()
      $("<li><a href=\"#\"><div class=\"status-icon green\"></div>" + $(this).val() + "</a> </li>").insertBefore ".folder-input"
      $(this).val ""
    return

  $("#menu-collapse").click ->
    if $(".page-sidebar").hasClass("mini")
      $(".page-sidebar").removeClass "mini"
      $(".page-content").removeClass "condensed-layout"
      $(".footer-widget").show()
    else
      $(".page-sidebar").addClass "mini"
      $(".page-content").addClass "condensed-layout"
      $(".footer-widget").hide()
      calculateHeight()
    return

  $(".inside").children("input").blur ->
    $(this).parent().children(".add-on").removeClass "input-focus"
    return

  $(".inside").children("input").focus ->
    $(this).parent().children(".add-on").addClass "input-focus"
    return

  $(".input-group.transparent").children("input").blur ->
    $(this).parent().children(".input-group-addon").removeClass "input-focus"
    return

  $(".input-group.transparent").children("input").focus ->
    $(this).parent().children(".input-group-addon").addClass "input-focus"
    return

  $(".bootstrap-tagsinput input").blur ->
    $(this).parent().removeClass "input-focus"
    return

  $(".bootstrap-tagsinput input").focus ->
    $(this).parent().addClass "input-focus"
    return

  $("#my-task-list").popover
    html: true
    content: ->
      $("#notification-list").html()

  $("#user-options").click ->
    $("#my-task-list").popover "hide"
    return

  $(".simple-chat-popup").click ->
    $(this).addClass "hide"
    $("#chat-message-count").addClass "hide"
    return

  setTimeout (->
    $("#chat-message-count").removeClass "hide"
    $("#chat-message-count").addClass "animated bounceIn"
    $(".simple-chat-popup").removeClass "hide"
    $(".simple-chat-popup").addClass "animated fadeIn"
    return
  ), 5000
  setTimeout (->
    $(".simple-chat-popup").addClass "hide"
    $(".simple-chat-popup").removeClass "animated fadeIn"
    $(".simple-chat-popup").addClass "animated fadeOut"
    return
  ), 8000
  jQuery(".page-sidebar li > a").on "click", (e) ->
    return  if $(this).next().hasClass("sub-menu") is false
    parent = $(this).parent().parent()
    parent.children("li.open").children("a").children(".arrow").removeClass "open"
    parent.children("li.open").children("a").children(".arrow").removeClass "active"
    parent.children("li.open").children(".sub-menu").slideUp 200
    parent.children("li").removeClass "open"
    sub = jQuery(this).next()
    if sub.is(":visible")
      jQuery(".arrow", jQuery(this)).removeClass "open"
      jQuery(this).parent().removeClass "active"
      sub.slideUp 200, ->
        handleSidenarAndContentHeight()
        return

    else
      jQuery(".arrow", jQuery(this)).addClass "open"
      jQuery(this).parent().addClass "open"
      sub.slideDown 200, ->
        handleSidenarAndContentHeight()
        return

    e.preventDefault()
    return

  if $(".page-sidebar").hasClass("mini")
    elem = jQuery(".page-sidebar ul")
    elem.children("li.open").children("a").children(".arrow").removeClass "open"
    elem.children("li.open").children("a").children(".arrow").removeClass "active"
    elem.children("li.open").children(".sub-menu").slideUp 200
    elem.children("li").removeClass "open"
  $("[data-height-adjust=\"true\"]").each ->
    h = $(this).attr("data-elem-height")
    $(this).css "min-height", h
    $(this).css "background-image", "url(" + $(this).attr("data-background-image") + ")"
    $(this).css "background-repeat", "no-repeat"
    return

  $("[data-aspect-ratio=\"true\"]").each ->
    $(this).height $(this).width()
    return

  $("[data-sync-height=\"true\"]").each ->
    equalHeight $(this).children()
    return

  $(window).resize ->
    $("[data-aspect-ratio=\"true\"]").each ->
      $(this).height $(this).width()
      return

    $("[data-sync-height=\"true\"]").each ->
      equalHeight $(this).children()
      return

    return

  $("#main-menu-wrapper").scrollbar()
  initExtendedLayoutMenuScroll()
  $(".tip").tooltip()
  $(".horizontal-menu .bar-inner > ul > li").on "click", ->
    $(this).toggleClass("open").siblings().removeClass "open"
    return

  if $("body").hasClass("horizontal-menu")
    $(".content").on "click", ->
      $(".horizontal-menu .bar-inner > ul > li").removeClass "open"
      return

  $("img.lazy").lazyload effect: "fadeIn"  if $.fn.lazyload
  $(".grid .tools a.remove").on "click", ->
    removable = jQuery(this).parents(".grid")
    if removable.next().hasClass("grid") or removable.prev().hasClass("grid")
      jQuery(this).parents(".grid").remove()
    else
      jQuery(this).parents(".grid").parent().remove()
    return

  $(".grid .tools a.reload").on "click", ->
    el = jQuery(this).parents(".grid")
    blockUI el
    window.setTimeout (->
      unblockUI el
      return
    ), 1000
    return

  $(".grid .tools .collapse, .grid .tools .expand").on "click", ->
    el = jQuery(this).parents(".grid").children(".grid-body")
    if jQuery(this).hasClass("collapse")
      jQuery(this).removeClass("collapse").addClass "expand"
      el.slideUp 200
    else
      jQuery(this).removeClass("expand").addClass "collapse"
      el.slideDown 200
    return

  $(".user-info .collapse").on "click", ->
    jQuery(this).parents(".user-info ").stop().slideToggle 400, "swing"
    return

  handleSidenarAndContentHeight = ->
    content = $(".page-content")
    sidebar = $(".page-sidebar")
    content.attr "data-height", content.height()  unless content.attr("data-height")
    if sidebar.height() > content.height()
      content.css "min-height", sidebar.height() + 120
    else
      content.css "min-height", content.attr("data-height")
    return

  $(".panel-group").on "hidden.bs.collapse", (e) ->
    $(this).find(".panel-heading").not($(e.target)).addClass "collapsed"
    return

  $(".panel-group").on "shown.bs.collapse", (e) ->

  $(window).setBreakpoints
    distinct: true
    breakpoints: [
      320
      480
      768
      1024
    ]

  $(window).bind "enterBreakpoint320", ->
    $("#main-menu-toggle-wrapper").show()
    $("#portrait-profile-menu").show()
    $("#header_inbox_bar").hide()
    $("#main-menu").removeClass "mini"
    $(".page-content").removeClass "condensed"
    rebuildSider()
    return

  $(window).bind "enterBreakpoint480", ->
    $("#main-menu-toggle-wrapper").show()
    $(".header-seperation").show()
    $("#portrait-profile-menu").show()
    $("#header_inbox_bar").hide()
    $("#main-menu").removeClass "mini"
    $(".page-content").removeClass "condensed"
    rebuildSider()
    return

  $(window).bind "enterBreakpoint768", ->
    $("#main-menu-toggle-wrapper").show()
    $("#portrait-profile-menu").show()
    $("#header_inbox_bar").hide()
    if /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)
      $("#main-menu").removeClass "mini"
      $(".page-content").removeClass "condensed"
      rebuildSider()
    return

  $(window).bind "enterBreakpoint1024", ->
    if /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)
      elem = jQuery(".page-sidebar ul")
      elem.children("li.open").children("a").children(".arrow").removeClass "open"
      elem.children("li.open").children("a").children(".arrow").removeClass "active"
      elem.children("li.open").children(".sub-menu").slideUp 200
      elem.children("li").removeClass "open"
    $(".bar").show()
    $(".bar").css "overflow", "visible"
    return

  $(window).bind "exitBreakpoint320", ->
    $("#main-menu-toggle-wrapper").hide()
    $("#portrait-profile-menu").hide()
    $("#header_inbox_bar").show()
    closeAndRestSider()
    return

  $(window).bind "exitBreakpoint480", ->
    $("#main-menu-toggle-wrapper").hide()
    $("#portrait-profile-menu").hide()
    $("#header_inbox_bar").show()
    closeAndRestSider()
    return

  $(window).bind "exitBreakpoint768", ->
    $("#main-menu-toggle-wrapper").hide()
    $("#portrait-profile-menu").hide()
    $("#header_inbox_bar").show()
    closeAndRestSider()
    return

  $("#main-menu-toggle").on "touchstart click", (e) ->
    e.preventDefault()
    toggleMainMenu()
    return

  $("#chat-menu-toggle, .chat-menu-toggle").on "touchstart click", (e) ->
    e.preventDefault()
    toggleChat()
    return

  $("#layout-condensed-toggle").click ->
    if $("#main-menu").attr("data-inner-menu") is "1"
      console.log "Menu is already condensed"
    else
      if $("#main-menu").hasClass("mini")
        $("body").removeClass "grey"
        $("body").removeClass "condense-menu"
        $("#main-menu").removeClass "mini"
        $(".page-content").removeClass "condensed"
        $(".scrollup").removeClass "to-edge"
        $(".header-seperation").show()
        $(".header-seperation").css "height", "61px"
        $(".footer-widget").show()
      else
        $("body").addClass "grey"
        $("#main-menu").addClass "mini"
        $(".page-content").addClass "condensed"
        $(".scrollup").addClass "to-edge"
        $(".header-seperation").hide()
        $(".footer-widget").hide()
        $(".main-menu-wrapper").scrollbar "destroy"
    return

  $("#horizontal-menu-toggle").click ->
    $(".bar").slideToggle 200, "linear"  if $("body").hasClass("breakpoint-480") or $("body").hasClass("breakpoint-320")
    return

  $(".scroller").each ->
    h = $(this).attr("data-height")
    $(this).scrollbar ignoreMobile: true
    if h? or h isnt ""
      if $(this).parent(".scroll-wrapper").length > 0
        $(this).parent().css "max-height", h
      else
        $(this).css "max-height", h
    return

  $(".dropdown-toggle").click ->
    $("img").trigger "unveil"
    return

  if $.fn.sparkline
    $(".sparklines").sparkline "html",
      enableTagOptions: true

  $("table th .checkall").on "click", ->
    if $(this).is(":checked")
      $(this).closest("table").find(":checkbox").attr "checked", true
      $(this).closest("table").find("tr").addClass "row_selected"
    else
      $(this).closest("table").find(":checkbox").attr "checked", false
      $(this).closest("table").find("tr").removeClass "row_selected"
    return

  $(".animate-number").each ->
    $(this).animateNumbers $(this).attr("data-value"), true, parseInt($(this).attr("data-animation-duration"), 10)
    return

  $(".animate-progress-bar").each ->
    $(this).css "width", $(this).attr("data-percentage")
    return

  $(".widget-item > .controller .reload").click ->
    el = $(this).parent().parent()
    blockUI el
    window.setTimeout (->
      unblockUI el
      return
    ), 1000
    return

  $(".widget-item > .controller .remove").click ->
    $(this).parent().parent().parent().addClass "animated fadeOut"
    $(this).parent().parent().parent().attr "id", "id_remove_temp_id"
    setTimeout (->
      $("#id_remove_temp_id").remove()
      return
    ), 400
    return

  $(".tiles .controller .reload").click ->
    el = $(this).parent().parent().parent()
    blockUI el
    window.setTimeout (->
      unblockUI el
      return
    ), 1000
    return

  $(".tiles .controller .remove").click ->
    $(this).parent().parent().parent().parent().addClass "animated fadeOut"
    $(this).parent().parent().parent().parent().attr "id", "id_remove_temp_id"
    setTimeout (->
      $("#id_remove_temp_id").remove()
      return
    ), 400
    return

  return  unless jQuery().sortable
  $(".sortable").sortable
    connectWith: ".sortable"
    iframeFix: false
    items: "div.grid"
    opacity: 0.8
    helper: "original"
    revert: true
    forceHelperSize: true
    placeholder: "sortable-box-placeholder round-all"
    forcePlaceholderSize: true
    tolerance: "pointer"

  $(window).resize ->
    calculateHeight()
    return

  $(window).scroll ->
    if $(this).scrollTop() > 100
      $(".scrollup").fadeIn()
    else
      $(".scrollup").fadeOut()
    return

  $(".scrollup").click ->
    $("html, body").animate
      scrollTop: 0
    , 700
    false

  $("img").unveil()
  return

$(document).ready ready
$(document).on "page:load", ready

$("body.open-menu-left .page-content").on "touchstart", (e) ->
  alert "asd"
  return

(($) ->
  $.fn.toggleMenu = ->
    windowWidth = window.innerWidth
    $(this).toggleClass "hide-sidebar"  if windowWidth > 768
    return

  $.fn.condensMenu = ->
    windowWidth = window.innerWidth
    if windowWidth > 768
      $(this).toggleClass "hide-sidebar"  if $(this).hasClass("hide-sidebar")
      $(this).toggleClass "condense-menu"
      $(this).find("#main-menu").toggleClass "mini"
    return

  $.fn.toggleFixedMenu = ->
    windowWidth = window.innerWidth
    $(this).toggleClass "menu-non-fixed"  if windowWidth > 768
    return

  $.fn.toggleHeader = ->
    $(this).toggleClass "hide-top-content-header"
    return

  $.fn.toggleChat = ->
    toggleChat()
    return

  $.fn.layoutReset = ->
    $(this).removeClass "hide-sidebar"
    $(this).removeClass "condense-menu"
    $(this).removeClass "hide-top-content-header"
    $(this).find("#main-menu").removeClass "mini"  unless $("body").hasClass("extended-layout")
    return

  return
) jQuery
