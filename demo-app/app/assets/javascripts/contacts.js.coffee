# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#
$ ->
  # index
  $('#lead_type_dialog').dialog(
    autoOpen: false,
    height: 75,
    width: 50,
    modal: true)

  $('.contact_lead_type').live('click', (e) ->
    e.preventDefault()
    $('#lead_types img').attr('data-contact_id', @dataset.contact_id)
    openLeadTypeSelection()
  )

  $('.lead_type_selection').live('click', (e) ->
    e.preventDefault()
    updateLeadType(@dataset.contact_id, @dataset.lead_type)
  )

  # form
  attachDraggables()
  attachDropTargets()

  handleClicks '#view_contact_linkedin_profile', openInIframe

attachDraggables = () ->
  draggables = $('#lead_types img')
  [].forEach.call(draggables, (draggable) ->
    draggable.addEventListener('dragstart' , handleDragStart , false)
    draggable.addEventListener('dragend'   , handleDragEnd   , false)
  )

attachDropTargets = () ->
  drop_targets = $('#drop_target')
  [].forEach.call(drop_targets, (target) ->
    target.addEventListener('dragenter' , handleDragEnter , false)
    target.addEventListener('dragover'  , handleDragOver  , false)
    target.addEventListener('dragleave' , handleDragLeave , false)
    target.addEventListener('drop'      , handleDrop      , false)
  )

handleDragStart = (e) ->
  e.dataTransfer.effectAllowed = 'move'
  e.dataTransfer.setData('text/html', @innerHTML)

handleDragOver = (e) ->
  e.preventDefault() if e.preventDefault() # Necessary. Allows us to drop.
  e.dataTransfer.dropEffect = 'move'

handleDragEnter = (e) ->
  $(this).addClass 'over'

handleDragLeave = (e) ->
  $(this).removeClass 'over'

handleDrop = (e) ->
  e.stopPropagation() if e.stopPropagation() # stops the browser from redirecting.
  @innerHTML = e.dataTransfer.getData 'text/html'

handleDragEnd = (e) ->
  $('#contact_lead_type').val @dataset.lead_type
  drop_targets = $('#drop_target')
  [].forEach.call(drop_targets, (target) ->
    $(target).removeClass 'over'
  )

getIcon = (data) ->
  /(hot-icon\.png|neutral-icon\.png|cold-icon\.png)/i.exec(data)[0]

openInIframe = () ->
  $('#linkedin_frame').attr('src', '/static/Jim_Holmes_LinkedIn.html')

openLeadTypeSelection = () ->
  $('#lead_type_dialog').dialog 'open'

closeLeadTypeSelection = () ->
  $('#lead_type_dialog').dialog 'close'

updateLeadType = (id, lead_type) ->
  $.ajax(
    type: 'POST'
    url: "/contacts/update_lead_type",
    data: "id=#{id}&lead_type=#{lead_type}",
    dataType: 'json'
    success: (data) -> updateLeadTypeSuccess(data),
  )

updateLeadTypeSuccess = (data) ->
  closeLeadTypeSelection()
  refreshContactRow(data)

refreshContactRow = (contact) ->
  image_html = "<img class='contact_lead_type' data-contact_id='#{contact.id}' height='13' src='/assets/#{contact.lead_type.toLowerCase()}-icon.png' width='13' /></td>"
  $("#lead_type_cell-#{contact.id}").html(image_html)

