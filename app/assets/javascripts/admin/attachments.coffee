$ ->
  newAttachmentId = 1

  addAttachmentTemplate = ->
    $('.attachments .attachment-form-template').html()
      # .replace("new_attachments[0]", "new_attachments_test")

  $('.attachments .add-attachment button').click ->
    $('.attachments .add-attachment').before "
      <div class='list-group-item'>#{addAttachmentTemplate()}</div>
    "

  $('.attachments').on 'click', '.delete-new-attachment', ->
    $(this).closest('.list-group-item').remove()

  $('.attachments .delete-existing-attachment').click ->
    $(this).closest('.list-group-item')
      .addClass('hidden')
      .find('input[type=checkbox]').attr('checked', true)

  $('.attachments .delete-all-attachments').click ->
    $('.attachments .delete-existing-attachment').trigger('click')
