$ ->
  $(".add_node_radio").click ->
    $this  = $(this)
    $modal = $this.closest(".modal")
    isOne  = $this.val() == "one"
    $modal.find(".add_one_node_form").toggle(isOne)
    $modal.find(".add_multiple_nodes_form").toggle(!isOne)

  $(".modal_add_node_submit_btn").click ->
    $(this).attr('disabled', 'disabled').val('Processing...')
    $(this).closest(".modal").find("form:visible").submit()

  $(".add_multiple_nodes_form").submit (e) ->
    $modal = $(this).closest(".modal")
    unless $modal.find(".nodes_list").val().trim()
      e.preventDefault()
      $(".modal_add_node_submit_btn").removeAttr('disabled').val('Add')
      $(".add_multiple_nodes_error").show()

  if $('body.nodes.show').length
    $('#scripts-tabs li').first().addClass('active')
    $('#scripts-tabs .tab-pane').first().addClass('active')
