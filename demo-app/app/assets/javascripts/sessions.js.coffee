# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#
$ ->
  toggle_login_button()

  $('#username').keyup ->
    toggle_login_button()

  $('#password').keyup ->
    toggle_login_button()

  $('#login_dialog').dialog(
    autoOpen: false,
    height: 200,
    width: 250,
    modal: true)

  $('#show_login_dialog').click ->
    $('#login_dialog').dialog 'open'

toggle_login_button = () -> if login_allowed() then enable_login() else disable_login()
login_allowed = () -> $('#username').val() != '' and $('#password').val() != ''
enable_login = () -> $('#login_button').attr 'disabled', false
disable_login = () -> $('#login_button').attr 'disabled', true
