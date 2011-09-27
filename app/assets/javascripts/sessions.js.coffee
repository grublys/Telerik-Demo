# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#
$ ->
  toggleLoginButton()

  handleKeyups '#username', toggleLoginButton
  handleKeyups '#password', toggleLoginButton
  handleClicks '#login_link', openLoginDialog

  $('#login_dialog').dialog
    autoOpen: false,
    height: 200,
    width: 300,
    modal: true

toggleLoginButton = () -> if loginAllowed() then enableLogin() else disableLogin()
loginAllowed = () -> $('#username').val() != '' and $('#password').val() != ''
enableLogin = () -> $('#login_button').attr 'disabled', false
disableLogin = () -> $('#login_button').attr 'disabled', true
openLoginDialog = () ->
  $('#flash_alert').html('')
  $('#login_dialog').dialog 'open'
