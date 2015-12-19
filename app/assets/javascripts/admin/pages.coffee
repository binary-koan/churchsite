$ ->
  toggleEditor = ->
    if /custom/i.test($("#page_type").val())
      $("#page_content_group").show()
    else
      $("#page_content_group").hide()

  $("#page_type").on("change", toggleEditor)
  toggleEditor()
