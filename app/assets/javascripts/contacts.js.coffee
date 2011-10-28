# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#
$ ->
  # index
  $('#lead_type_dialog').dialog
    autoOpen: false,
    height: 110,
    width: 200,
    modal: true

  $('.contact_lead_type').live 'click', (e) ->
    e.preventDefault() if e.preventDefault()
    contact_id = $(this).attr('data-contact_id')
    $.each $('#lead_types img'), (i,v) ->
      $(v).attr('data-contact_id', contact_id)
    openLeadTypeSelection()

  $('.lead_type_selection').live 'click', (e) ->
    e.preventDefault() if e.preventDefault()
    updateLeadType $(this).attr('data-contact_id'), $(this).attr('data-lead_type')

  $('#selection_technology').change (e) ->
    e.preventDefault() if e.preventDefault()
    updateViewsForTechnology $('select#selection_technology :selected').val()

  $('#selection_view').change (e) ->
    e.preventDefault() if e.preventDefault()
    gotoView $('select#selection_technology :selected').val(),
             $('select#selection_view :selected').val()

  # form
  attachDraggables()
  attachDropTargets()

  openInIframe()
  #handleClicks '#view_contact_linkedin_profile', openInIframe

  $('#govt_contracts').hide()
  $('#contact_govt_contract').live 'click', (e) ->
    $('#govt_contracts').toggle()

  # treeview
  $('.lead_type_children').toggle()
  $('.lead_type_parent').live 'click', (e) ->
    e.preventDefault() if e.preventDefault()
    openChildren $(this).attr('data-lead_type')

@attachDraggables = () ->
  draggables = $('#lead_types img')
  [].forEach.call draggables, (draggable) ->
    draggable.addEventListener('dragstart' , handleDragStart , false)
    draggable.addEventListener('dragend'   , handleDragEnd   , false)

@attachDropTargets = () ->
  drop_targets = $('.drop_target')
  [].forEach.call drop_targets, (target) ->
    target.addEventListener('dragenter' , handleDragEnter , false)
    target.addEventListener('dragover'  , handleDragOver  , false)
    target.addEventListener('dragleave' , handleDragLeave , false)
    target.addEventListener('drop'      , handleDrop      , false)

handleDragStart = (e) ->
  e.dataTransfer.effectAllowed = 'move'
  e.dataTransfer.setData 'Text', image(this)

handleDragOver = (e) ->
  e.preventDefault() if e.preventDefault() # Necessary. Allows us to drop.
  $(this).addClass 'over'
  e.dataTransfer.dropEffect = 'move'

handleDragEnter = (e) ->
  $(this).addClass 'over'

handleDragLeave = (e) ->
  $(this).removeClass 'over'

handleDrop = (e) ->
  e.preventDefault() if e.preventDefault()
  $(this).prop 'innerHTML', e.dataTransfer.getData('Text')

handleDragEnd = (e) ->
  $('#contact_lead_type').val $(this).attr('data-lead_type')
  drop_targets = $('.drop_target')
  [].forEach.call drop_targets, (target) ->
    $(target).removeClass 'over'

image = (element) ->
  "<img src='#{element.src}' height='#{element.height}' width='#{element.width}' alt='#{element.alt}'/>"

openInIframe = () ->
  $('#linkedin_frame').attr('src', '/static/Jim_Holmes_LinkedIn.html')

openLeadTypeSelection = () ->
  $('#lead_type_dialog').dialog 'open'

closeLeadTypeSelection = () ->
  $('#lead_type_dialog').dialog 'close'

updateViewsForTechnology = (tech) ->
  if tech
    $.ajax
      type: 'GET',
      url: '/contacts/update_views_for_technology',
      data: "tech=#{tech}",
      dataType: 'json',
      success: (data) -> updateViewSelection(data)
  else
    resetSelectionView()
    $('#selection_view').attr('disabled', 'disabled')

updateViewSelection = (views) ->
  resetSelectionView()
  $.each views, (value, text) ->
    $('#selection_view').append($('<option></option>').attr('value',text).text(text))
  $('#selection_view').removeAttr('disabled')

resetSelectionView = () ->
  $('#selection_view').empty()
  $('#selection_view').append($('<option></option>').text('Select View'))

gotoView = (technology, view) ->
  switch technology
    when "HTML5" then gotoHtml5(view)
    when "RadControls" then gotoRadControls(view)

gotoHtml5 = (view) ->
  switch view
    when "HTML5 Grid" then window.location.href = "http://localhost:3000/contacts"
    when "HTML5 Tree" then window.location.href = "http://localhost:3000/contacts/treeview"

gotoRadControls = (view) ->
  switch view
    when "RadGrid" then window.location.href = "http://localhost:80/demo-app"
    when "RadTree" then alert "RadTree not yet implemented"

updateLeadType = (contact_id, lead_type) ->
  $.ajax
    type: 'POST',
    url: "/contacts/update_lead_type",
    data: "id=#{contact_id}&lead_type=#{lead_type}",
    dataType: 'json',
    success: (data) -> updateLeadTypeSuccess(data)

updateLeadTypeSuccess = (data) ->
  closeLeadTypeSelection()
  refreshContactRow(data)

refreshContactRow = (contact) ->
  image_html = "<img class='contact_lead_type' data-contact_id='#{contact.id}' height='23' src='/assets/#{contact.lead_type}.png' width='23' /></td>"
  $("#lead_type_cell-#{contact.id}").html(image_html)

openChildren = (lead_type) ->
  $(".lead_type_children.#{lead_type}").toggle()
