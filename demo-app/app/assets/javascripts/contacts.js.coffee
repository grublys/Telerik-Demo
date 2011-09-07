# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#
$ ->
  handleDragStart = (e) ->
    @style.opacity = '0.4'

    e.dataTransfer.effectAllowed = 'move'
    e.dataTransfer.setData('text/html', @innerHTML)

  handleDragOver = (e) ->
    if e.preventDefault()
      e.preventDefault # Necessary. Allows us to drop.

    e.dataTransfer.dropEffect = 'move'

    return false

  handleDragEnter = (e) ->
    $(this).addClass 'over'

  handleDragLeave= (e) ->
    $(this).removeClass 'over'

  handleDrop = (e) ->
    if e.stopPropagation()
      e.stopPropagation # stops the browser from redirecting.

    lead_types = new Object()
    lead_types['hot-icon.png'] = 'HOT'
    lead_types['neutral-icon.png'] = 'NEUTRAL'
    lead_types['cold-icon.png'] = 'COLD'

    @innerHTML = e.dataTransfer.getData 'text/html'
    transferredIcon = getIcon(e.dataTransfer.getData('text/html'))
    $('#contact_lead_type').val(lead_types[transferredIcon])

    return false

  getIcon = (data) ->
    image_src = /(hot-icon\.png|neutral-icon\.png|cold-icon\.png)/i.exec(data)
    return image_src[0]

  handleDragEnd = (e) ->
    [].forEach.call(cols, (col) ->
      $(col).removeClass 'over'
    )

  cols = document.querySelectorAll('#columns .column')
  [].forEach.call(cols, (col) ->
    col.addEventListener('dragstart', handleDragStart, false)
    return true;
  )

  drop_targets = document.querySelectorAll('#drop_target')
  [].forEach.call(drop_targets, (target) ->
    target.addEventListener('dragenter' , handleDragEnter , false)
    target.addEventListener('dragover'  , handleDragOver  , false)
    target.addEventListener('dragleave' , handleDragLeave , false)
    target.addEventListener('drop'      , handleDrop      , false)
    target.addEventListener('dragend'   , handleDragEnd   , false)
    return true;
  )

