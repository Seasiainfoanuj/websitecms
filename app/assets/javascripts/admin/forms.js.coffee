ready = ->
  $('form').on 'click', '.remove_fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('fieldset').hide()
    event.preventDefault()

  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault()

  $(".slug-title").blur ->
    title = $(this).val()
    slug = title.toString().toLowerCase().replace(/\s+/g, "-").replace(/[^\w\-]+/g, "").replace(/\-\-+/g, "-").replace(/^-+/, "").replace /-+$/, ""
    $(".slug").val(slug).prop('readonly', true) unless $(".slug").val()

  $('form').on 'click', '.edit-slug-btn', (event) ->
    $(".slug").prop('readonly', false)
    event.preventDefault()

  $(".slug").blur ->
    $(this).prop('readonly', true)

  initEditor = ->
    csrf_token = $("meta[name=csrf-token]").attr("content")
    csrf_param = $("meta[name=csrf-param]").attr("content")
    params = undefined
    params = csrf_param + "=" + encodeURIComponent(csrf_token)  if csrf_param isnt `undefined` and csrf_token isnt `undefined`

    $(".editor").redactor
      imageUpload: "/redactor_rails/pictures?" + params
      imageManagerJson: "/redactor_rails/pictures"
      fileUpload: "/redactor_rails/documents?" + params
      fileManagerJson: "/redactor_rails/documents"
      plugins: ['video', 'table', 'imagemanager', 'filemanager', 'fullscreen']
      replaceDivs: false
      convertDivs: false
      minHeight: 200
      buttonSource: true

  initEditor()

  $(".dropzone").dropzone()

  if $("#bulk-destroy-form").length > 0
    $('form').on 'click', '#bulk-destroy-btn', (event) ->
      if confirm("Are you sure you want to remove selected items?")
        event.preventDefault()

        _href = $('#bulk-destroy-form').attr 'action'
        $selected_rows = []

        $('.row-checkbox').each (index) ->
          if @checked
            $selected_rows.push($(this).data('id'))

        params =
          ids: $selected_rows

        window.location.href = _href + "?" + jQuery.param params
      else
        event.preventDefault()
        # Do Nothing

  if $(".notification").length > 0
    $('.notification').each (index) ->
      Messenger().post $(this).text()

$(document).ready ready
$(document).on "page:load", ready
