# Reorder lists in the admin section
do ->
  updateOrder = ($list, { successMessage }) ->
    data = {}
    $list.children("li").each (index, item) ->
      data[$(item).data("document-id")] = index

    href = location.href.split("?")[0]
    $.post("#{href}/reorder", { data: data })
      .done((data) ->
        if data.error then displayMessage("Error: #{e.error}", "danger")
        else displayMessage("<strong>Successfully reordered!</strong> #{successMessage || ""}", "success")
      )
      .fail((e) ->
        displayMessage("""
          <strong>Can't communicate with the server</strong>
          <pre><code>#{e.responseText}</code></pre>
        """, "danger")
      )

  setupReorder = ($element, options={}) ->
    return unless $element.length

    Sortable.create($element.get(0),
      animation: 150,
      onEnd: updateOrder.bind(null, $element, options)
    )

  $ ->
    setupReorder($("#top-level-pages"), successMessage: "Reload to update the site navigation.")
    setupReorder($("#child-pages"), successMessage: "Reload to update the site navigation.")
    setupReorder($(".gallery.reorderable"))
