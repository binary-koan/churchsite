$ ->
  $contact_link = $('#contact-link')
  $contact_link.popover
    html: true
    placement: 'bottom'
    content: $contact_link.next('.popover').html()
    template: '<div class="popover"><div class="arrow"></div><div class="popover-inner"><div class="popover-content"><p></p></div></div></div>'
