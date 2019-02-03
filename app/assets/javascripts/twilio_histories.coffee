# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

window.load_data = ()=>
  $.get '/twilio_histories?'+Math.random(), (response) ->
    twilio_histories = response.twilio_histories

    for history in twilio_histories
      html = "#{html} <tr>
        <td>#{history.from}</td>
        <td>#{history.to}</td>
        <td>#{history.body}</td>
        <td><a href='/twilio_histories/"+history.id+"/delete'>Delete</a></td>
      "
    $('#twilio-table-body').html(html)
    return
  , 'json'
