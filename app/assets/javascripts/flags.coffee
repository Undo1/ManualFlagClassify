# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $("button.flag_class_button").on "click", ->
    button = $(this)
    $.ajax
      url: "/flags/assign_class"
      method: "put"
      data: {"flag_id": button.data("flag_id"), "flag_class_id": button.data("classid")}
      success: -> 
        button.css("font-weight", "bold")
        button.css("background-color", "black")
