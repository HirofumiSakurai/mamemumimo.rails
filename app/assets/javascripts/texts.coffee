# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  autosize(document.querySelectorAll('textarea'));

  focusoutByInsideEvent = (event, element) ->
    for ancestor in $(event.relatedTarget).parents()
      if $(ancestor).is($(element))
        return true
    return false

  $("ul#text-entry li.list-group-item").click () ->
    # console.log("editing focusin")
    $(this).addClass("editing")
  $("ul#text-entry li.list-group-item").focusout (e) ->
    # if e.relatedTarget == null
    #   return true
    if focusoutByInsideEvent e, this
      # console.log("editing focusout denied")
      return true
    # console.log("editing focusout")
    $(this).removeClass("editing")
    return false
  $("ul#text-entry li.list-group-item div button").click () ->
    # console.log("append click")
    li = $(this).closest("li.text-item");
    li.addClass("appending editing")
    #$($(this).parents()[3]).find(".append").find(".form-control").focus()
    $("#append-form-#{li.attr('id')}").children("#text_entity").focus()
    li.addClass("appending editing")

  $("ul#text-entry li.list-group-item div.append").focusout (e) ->
    if focusoutByInsideEvent e, this
      return true
    li = $(this).closest("li.text-item");
    li.removeClass("appending")
    return false
  $("ul#text-entry li.list-group-item div.append form")
    .bind("ajax:success", () ->
      li = $(this).closest("li.text-item");
      id = li.attr("id")
      input = $("#append-form-#{id}").children("#text_entity")
      $("#text-entity-#{id}").append( input.val() )
      input.val("")
      input.focus()
    )
  $("ul#text-entry li.list-group-item div.display p span.entity").click (e) ->
    # console.log(e)
    li = $(this).closest("li.text-item");
    id = li.attr("id")
    if li.hasClass("editing")
      sel = window.getSelection()
      if sel.isCollapsed
        pos = sel.anchorOffset
        li.addClass("inserting")
        $("#insert-method-#{id}").val("insert")
        $("#insert-position-#{id}").val(pos)
        $("#insert-form-#{id}").children("#text_entity").focus()
        $("#save").html($(this).html())
        $(this).html($(this).html().slice(0,pos) + "|" + $(this).html().slice(pos))
  $("ul#text-entry li.list-group-item div.insert").focusout (e) ->
    li = $(this).closest("li.text-item");
    id = li.attr("id")
    if not (focusoutByInsideEvent e, this)
      li.removeClass("inserting")
    $("#text-entity-#{id}").html( $("#save").html())
    return false
  $("ul#text-entry li.list-group-item div.insert form").bind("ajax:success", () ->
      li = $(this).closest("li.text-item");
      id = li.attr("id")
      input = $("#insert-form-#{id}").children("#text_entity")
      text_entity = $("#text-entity-#{id}")
      e = $("#save").html()
      pos = window.getSelection().anchorOffset
      text_entity.html( e.slice(0,pos) + input.val() + e.slice(pos) )
      input.val("")
      text_entity.focus()
    )
  return
