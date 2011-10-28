
$ ->
  $('#selection_technology').change (e) ->
    e.preventDefault() if e.preventDefault()
    updateViewsForTechnology $('select#selection_technology :selected').val()           

  $('#selection_view').change (e) ->
    e.preventDefault() if e.preventDefault()
    gotoView $('select#selection_technology :selected').val(),
             $('select#selection_view :selected').val()

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

