# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#
$ ->
  $('#login_dialog').dialog(
    autoOpen: false,
    height: 200,
    width: 250,
    modal: true)

  $('#show_login_dialog').click ->
    $('#login_dialog').dialog 'open'
