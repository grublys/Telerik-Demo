# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#
$ ->
  $('#login_button').attr 'disabled', true
  $('#username').keyup ->
    if $('#username').val() != '' and $('#password').val() != ''
      $('#login_button').attr 'disabled', false
    else
      $('#login_button').attr 'disabled', true

  $('#password').keyup ->
    if $('#username').val() != '' and $('#password').val() != ''
      $('#login_button').attr 'disabled', false
    else
      $('#login_button').attr 'disabled', true

  $('#login_dialog').dialog(
    autoOpen: false,
    height: 200,
    width: 250,
    modal: true)

  $('#show_login_dialog').click ->
    $('#login_dialog').dialog 'open'

