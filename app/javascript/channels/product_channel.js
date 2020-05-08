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
    var message = `<div class="card text-white bg-success mb-3" style="max-width: 20rem;">
                     <div class="card-header" style='max-height: 3rem;'>
                       <img src="..." class="rounded mr-2" alt="...">
                       <strong class="mr-auto">Bootstrap</strong>
                       <small>11 mins ago</small>
                     </div>
                     <div class="card-body">
                       <p class="card-text">${data['message']}</p>
                     </div>
                  </div>`;
    console.log(current_user);
    var messages = document.getElementById('messages');
    messages.insertAdjacentHTML('beforeend', message);
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