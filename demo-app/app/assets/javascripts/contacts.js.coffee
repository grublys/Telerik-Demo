# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#
$ ->
  handleDragStart = (e) ->
    e.dataTransfer.effectAllowed = 'move'
    e.dataTransfer.setData('text/html', @innerHTML)

  handleDragOver = (e) ->
    if e.preventDefault()
      e.preventDefault # Necessary. Allows us to drop.

    e.dataTransfer.dropEffect = 'move'

  handleDragEnter = (e) ->
    $(this).addClass 'over'

  handleDragLeave = (e) ->
    $(this).removeClass 'over'

  handleDrop = (e) ->
    if e.stopPropagation()
      e.stopPropagation # stops the browser from redirecting.

    lead_types = new Array()
    lead_types['hot-icon.png'] = 'HOT'
    lead_types['neutral-icon.png'] = 'NEUTRAL'
    lead_types['cold-icon.png'] = 'COLD'

    @innerHTML = e.dataTransfer.getData 'text/html'
    transferredIcon = getIcon(e.dataTransfer.getData('text/html'))
    $('#contact_lead_type').val(lead_types[transferredIcon])

  handleDragEnd = (e) ->
    [].forEach.call(drop_targets, (target) ->
      $(target).removeClass 'over'
    )

  getIcon = (data) ->
    /(hot-icon\.png|neutral-icon\.png|cold-icon\.png)/i.exec(data)[0]

  draggables = $('#lead_types img')
  [].forEach.call(draggables, (draggable) ->
    draggable.addEventListener('dragstart' , handleDragStart , false)
    draggable.addEventListener('dragend'   , handleDragEnd   , false)
  )

  drop_targets = $('#drop_target')
  [].forEach.call(drop_targets, (target) ->
    target.addEventListener('dragenter' , handleDragEnter , false)
    target.addEventListener('dragover'  , handleDragOver  , false)
    target.addEventListener('dragleave' , handleDragLeave , false)
    target.addEventListener('drop'      , handleDrop      , false)
  )

