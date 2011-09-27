@handleClicks = (selector, callback) ->
  handlers selector, callback, 'click'

@handleKeyups = (selector, callback) ->
  handlers selector, callback, 'keyup'

@handlers = (selector, callback, event) ->
  $(selector).live event, (e) ->
    e.preventDefault()
    callback $(this)

