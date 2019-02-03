<% if @twilio_history.errors.any? %>
  <%
  error_str = ""

  @error_messages.each do |key, value|
    error_str += "#{value.join(' ')}\\n"
  end

  %>
  alert "<%=sanitize(error_str) %>"
<% else %>
  $('#twilio-table-body').append "" +
    "<tr><td><%=@twilio_history.from %></td>
    <td><%=@twilio_history.to %></td>
    <td><%=@twilio_history.body %></td>
    <td><a href='<%=twilio_history_path(@twilio_history) %>/delete'>Delete</a></td>
    "
  offset = $('#last').offset();
  $('html, body').animate
    scrollTop: offset.top
    scrollLeft: offset.left
  $('.twilio-form').get(0).reset()
<% end %>
