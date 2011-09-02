# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#
$ ->
  $('#login_button').attr 'disabled', true
  $('#username').keyup ->
    if login_allowed() then enable_login() else disable_login()

  $('#password').keyup ->
    if login_allowed() then enable_login() else disable_login()

  $('#login_dialog').dialog(
    autoOpen: false,
    height: 200,
    width: 250,
    modal: true)

  $('#show_login_dialog').click ->
    $('#login_dialog').dialog 'open'

login_allowed = () -> $('#username').val() != '' and $('#password').val() != ''
enable_login = () -> $('#login_button').attr 'disabled', false
disable_login = () -> $('#login_button').attr 'disabled', true
