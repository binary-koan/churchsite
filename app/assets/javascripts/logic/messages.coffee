window.displayMessage = (message, type) ->
  $(".messages").html """
    <div class="alert alert-#{type}">
      <button type="button" class="close" data-dismiss="alert"
        aria-label="Close"><span aria-hidden="true">&times;</span></button>
      #{message}
    </div>
  """
