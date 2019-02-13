ready = ->
  mobileWidthBase = 850

  # Return window"s width
  windowWidth = ->
    window.innerWidth or document.documentElement.clientWidth or document.body.clientWidth

  searchVehicles = ->
    $("#vs-preloader").show()
    if $("#vehicle-search-form").length > 0
      $.get $("#vehicle-search-form").attr("action"), $("#vehicle-search-form").serialize(), null, "script"
      false

  # Sticky / Scroll Header
  if $("#page-header").length > 0
    $("#page-header").sticky className: 'sticky'
  else if $("#global-header").length > 0
    $("#global-header").sticky className: 'sticky'

  if $("#global-header").length > 0
    if $("#landing-page").length > 0
      return
    toggleGlobalSearch = ->
      hideMobileNav()
      hideVehicleSearch()
      hideExplore()
      hideOverlay()

      $("#global-nav li").removeClass "active"
      $("#global-search").stop(true, false).slideToggle 100

    hideGlobalSearch = ->
      $("#global-search").stop(true, false).slideUp 100

    hideVehicleSearch = ->
      $("#vehicle-search").hide 100

    toggleExplore = ->
      $("#explore").toggleClass("active")

      if $("#explore").hasClass "active"
        $("#page-header").unstick()
      else
        $("#page-header").sticky className: 'sticky'

    hideExplore = ->
      $("#explore").hide 100

    hideOverlay = ->
      $("#overlay").hide()

    toggleOverlay = ->
      $("#overlay").toggle()

    setMobileNav = ->
      if windowWidth() <= mobileWidthBase
        $("#global-nav").addClass "mobile-nav"
      else
        $("#global-nav").removeClass "mobile-nav"

    toggleMobileNav = ->
      $("#global-nav.mobile-nav").toggleClass "active"

      if $("#global-nav.mobile-nav").hasClass "active"
        $("#global-header").unstick()
      else
        $("#global-header").sticky className: 'sticky'

      $("#overlay").toggle()

    showMobileNav = ->
      $("#global-nav.mobile-nav").addClass "active"

    hideMobileNav = ->
      $("#global-nav.mobile-nav").removeClass "active"

    scrollTop = ->
      $("html, body").animate scrollTop: 0, 100
      $("#global-header").unstick()

    toggleOurRange = ->
      if $("#vehicle-search").length > 0
        toggleMobileNav()
        scrollTop()
        hideGlobalSearch()

        $("#vehicle-search").stop(true, false).toggle 100

        if $("#gn-our-range").hasClass("active") && $("#vehicle-search-form").length > 0
          unless $("#vehicle-search .vs-results-items").find(".vs-result").length
            searchVehicles()

    $(".gn-search-button").click (event) ->
      event.preventDefault()
      toggleGlobalSearch()

    $(".global-nav-toggle").click (event) ->
      event.preventDefault()
      hideGlobalSearch()
      toggleMobileNav()

    $("#global-nav li a").click (event) ->
      event.preventDefault() if $(this).hasClass("disable-link")
      $(this).parent().toggleClass("active").children(".dropdown").stop(true, true).toggle()

    $("#gn-our-range").click (event) ->
      event.preventDefault()
      toggleOurRange()

    $("a.our-range-search").click (event) ->
      event.preventDefault()
      toggleOurRange()
      $("#gn-our-range").addClass("active")
      if $(this).data('search')
        $("#vs-search").val $(this).data('search')
        searchVehicles()

    $("a.our-range-search.for-sale").click (event) ->
      event.preventDefault()
      $(".vs-filter-tab").removeClass "active"
      $("#vs-filter-tab-1").addClass "active"
      $("#vs-for-hire-filter").val $("#vs-filter-tab-1").data("value")
      searchVehicles()

    $("a.our-range-search.hire").click (event) ->
      event.preventDefault()
      $(".vs-filter-tab").removeClass "active"
      $("#vs-filter-tab-2").addClass "active"
      $("#vs-for-hire-filter").val $("#vs-filter-tab-2").data("value")
      searchVehicles()

    $(".vs-close-btn").click (event) ->
      event.preventDefault()
      toggleOurRange()
      hideOverlay()
      $("#gn-our-range").removeClass "active"

    # Page Header - requires global header
    if $("#page-header").length > 0
      $(".enquire-link").click (event) ->
        $('#enquire-model').modal('show')

      $(".explore-link").click (event) ->
        event.preventDefault()

        setTimeout (->
          $(".explore-link i").toggleClass('glyphicon-th').toggleClass('glyphicon-plus').toggleClass('transition')
        ), 10

        hideGlobalSearch()
        hideOverlay()
        toggleExplore()

        scrollTop()

    $(window).resize ->
      setMobileNav()

    setMobileNav()

  # Store View
  if $("#store-catalog").length > 0
    setGridView = ->
      if $(".search-results").hasClass("list")
        $("#list-view-btn").removeClass "selected"
        $("#grid-view-btn").addClass "selected"
        $(".search-results").hide()
        $(".search-results").removeClass("list").addClass "grid"

        $(".search-result-title").each (index) ->
          $(this).insertBefore $(this).prev()

        $(".search-result").wrap "<div class='result-grid-column col-sm-6 col-md-4'></div>"
        $(".search-results").fadeIn 200

    setListView = ->
      if $(".search-results").hasClass("grid")
        $("#grid-view-btn").removeClass "selected"
        $("#list-view-btn").addClass "selected"
        $(".search-results").hide()
        $(".search-results").removeClass("grid").addClass "list"
        $(".search-result").unwrap()

        $(".search-result-title").each (index) ->
          $(this).insertAfter $(this).next()

        $(".search-results").fadeIn 200

    toggleMobileCatalog = ->
      if windowWidth() <= 1000
        setGridView()
        $(".results-view-buttons").hide()
      else
        $(".results-view-buttons").show()

    $("#grid-view-btn").click ->
      setGridView()
      localStorage.setItem "store-view", "grid"

    $("#list-view-btn").click ->
      setListView()
      localStorage.setItem "store-view", "list"

    if localStorage.getItem("store-view")
      if localStorage.getItem("store-view") is "grid"
        setGridView()
      else
        setListView()

    $(window).resize ->
      toggleMobileCatalog()

    toggleMobileCatalog()

    if windowWidth() >= 765
      $("#store-catalog .aside").removeClass "hidden"
    else
      $("#store-catalog .aside").addClass "hidden"

    $(".filter-link").click ->
      $("#store-catalog .aside").toggleClass "hidden"

  # Vehicle Search
  if $("#vehicle-search").length > 0
    $(document).on "click", "#vehicle-search .vs-results-items .pagination a", (event) ->
      event.preventDefault()
      scrollTop()
      $.getScript @href
      false

    $("#vehicle-search-form").submit ->
      searchVehicles()

    $("#vehicle-search-form input").keyup ->
      # searchVehicles()

      filters = []
      $(".vs-filter-list a").each (index) ->
        filters.push $(this).data('filter')
        $(this).removeClass "active"
        $(this).parent().find("ul").hide()  if $(this).parent().has("ul").length

      search_params = $(this).val().toLowerCase().split(",")

      $.each search_params, (index, value) ->
        if $.inArray(value, filters) >= 0
          filter_link = $('*[data-filter="' + value + '"]')
          filter_link.addClass "active"
          filter_link.parent().find(">ul").show()  if $(filter_link.parent()).has("ul").length

    $(".vs-filter-tabs a").click (event) ->
      event.preventDefault()
      $(".vs-filter-tab").removeClass "active"
      $(this).addClass "active"
      $("#vs-for-hire-filter").val $(this).data("value")
      searchVehicles()

    $(".vs-filter-list-tabs a").click (event) ->
      event.preventDefault()
      href = $(this).attr("href")
      $(".vs-filter-list-tab").removeClass "active"
      $(this).addClass "active"

      $(".vs-filter-list").removeClass "active"
      $(href).addClass "active"

    $(".vs-filter-list a").click (event) ->
      event.preventDefault()
      parent = $(this).parent()

      parent.parent().find("a").not(this).removeClass("active").parent().find("ul").hide()

      $(this).toggleClass "active"

      if $(this).hasClass("active")
        $(parent).find(">ul").show()  if $(parent).has("ul").length
      else
        $(parent).find("ul").hide()  if $(parent).has("ul").length
        $(parent).find("*").removeClass("active")

      params = []
      $(".vs-filter-list a.active").each (index) ->
        params.push $(this).data('filter')  if $(this).data('filter')

      uniqueNames = []
      $.each params, (i, el) ->
        if $.inArray(el, uniqueNames) == -1
          uniqueNames.push el
        return

      $("#vs-search").val uniqueNames.join(",")

      searchVehicles()

  # Info Tabs
  if $(".info-tabs").length > 0
    $(".info-tab a").click (event) ->
      event.preventDefault()
      parent = $(this).parent()
      href = $(this).attr("href")
      $(".info-tab").removeClass "active"
      $(parent).toggleClass "active"
      $(".info-box").removeClass "active"
      $(href).addClass "active"

  if $(".info-box").length > 0
    $(".info-box-title h2").click (event) ->
      $(this).parent().toggleClass("active").next(".info-box-content").toggleClass "active"
      $(this).find("i").toggleClass("glyphicon-plus").toggleClass "glyphicon-minus"

  if $(".enquiry-form").length > 0
    $.get "/enquiries/enquiry_types", null, "script"

    $(".enquire-link").click (event) ->
      event.preventDefault()
      meta = "\n\n-----------------------------------------------\n"
      if $(this).data('meta')
        meta += $(this).data('meta') + "\n"
      $("#enquiry-form-details").val meta + "Enquiry URL: " + window.location.href

    $(".enquiry-form .submit-btn").click (event) ->
      console.log("Enquiry is submitted")
      event.preventDefault()
      form = $(this).closest(".enquiry-form")
        
      $.post form.attr("action"), form.serialize(), (response) ->
        console.log("Response type: " + response.type)
        if response.type is 'success'
          console.log("Response type is success")
          form.hide()
          msg = "Your enquiry has successfully been submitted REF #"
          msg += response.data.uid
          msg += ". One of our team members will get back to you shortly."
          form.prev(".enquiry-form-response").removeClass('error').addClass('success').html msg
        else if response.type is 'error'
          msg = "<h4>Please correct these errors:</h4>"
          msg += "<ul>"
          $.each response.data, (key, value) ->
            console.log("Response type = 'error'")
            console.log(response.data)
            $.each value, (i, val) ->
              msg += "<li>" + val + "</li>"
              return
          msg += "</ul>"
          form.prev(".enquiry-form-response").removeClass('success').addClass('error').html msg
        else
          form.prev(".enquiry-form-response").removeClass('success').addClass('error').html "There was a connection error while submitting your enquiry. Please try again soon."
      , "json"

  if $("#map-canvas").length > 0
    myLatlng = new google.maps.LatLng(-27.561718, 152.996081)
    mapOptions =
      zoom: 12
      center: myLatlng

    map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions)
    contentString = "<h3>Bus 4x4 Group</h3><p>1828 Ipswich Rd, <br> Rocklea, QLD 4106, Australia</p>"
    infowindow = new google.maps.InfoWindow(content: contentString)

    # To add the marker to the map, use the 'map' property
    marker = new google.maps.Marker(
      position: myLatlng
      map: map
      title: "Location Title"
    )
    google.maps.event.addListener marker, "click", ->
      infowindow.open map, marker

  if $("#enquiry-form").length > 0
    $('#tabs').tab()
    $('[data-behaviour~=datepicker]').datepicker({"format": "dd/mm/yyyy", "weekStart": 1, "autoclose": true})
    if $("#delivery_required").length > 0
      $("#delivery_required").prop('checked', false)
      $("span.or_more").hide()
      $("#delivery-location").hide()
      $("#delivery_required").on "click", ->
        if(this.checked)
          $("#delivery-location").show()
        else  
          $("#delivery-location").hide()
      $("#ongoing_contract").on "click", ->
        if(this.checked)
          $("#duration_unit").hide()
          $("#units").val("0")
          $("#units").hide()
          $("label.hire-period").hide()
        else
          $("#duration_unit").val("months")
          $("#duration_unit").show()
          $("#units").val("0")
          $("#units").show()
          $("label.hire-period").show()

$(document).ready ready
$(document).on "page:load", ready
