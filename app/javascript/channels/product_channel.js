import consumer from "./consumer"

$(function() {
const chatChannel = consumer.subscriptions.create({
    channel: "ProductChannel",
    product_id: $('#messages').data('product-id')
  }, {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    var li = $('<li>').text(data['message']);
    li.appendTo('#messages');
  },

  speak: function(message) {
    return this.perform('speak', {message: message});
  }
});

  $(document).on('click', '#message_button', function(){
    const value = $('#message_field').val();
    chatChannel.speak(value);
    document.getElementById('message_field').value = '';
    $('#message_field').focus();
  });
});