# Reorder lists in the admin section
do ->
  updateOrder = (list) ->
    $list = $(list)

    data = {}
    $list.children("li").each (index, item) ->
      data[$(item).data("document-id")] = index

    $.post("#{location.href}/reorder", { data: data })
      .done((data) ->
        if data.error then displayMessage("Error: #{e.error}", "danger")
        else displayMessage("Successfully reordered!", "success")
      )
      .fail((e) -> displayMessage("Can't communicate with the server: #{e}", "danger"))

  setupReorder = (element_id) ->
    list = document.getElementById(element_id)
    return unless list

    Sortable.create(list, animation: 150, onEnd: updateOrder.bind(null, list))

  $ ->
    setupReorder("top-level-pages")
    setupReorder("child-pages")
    setupReorder("photos")
