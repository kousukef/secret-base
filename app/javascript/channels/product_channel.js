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
    // message-typeに合ったmessageだけ表示させる
    if(data['message_type'] === $('#messages').data('message-type')){
    var message = `<div class="col-12">
                    <div class="card text-white bg-success mb-3 float-${data['right_or_left']}" style="max-width: 75%;">
                     <div class="card-header" style='max-height: 3rem;'>
                       <img src="${data['avatar']}" class="rounded mr-2" alt="user image">
                       <strong class="mr-auto">${data['user_name']}</strong>
                       <small>less than a minute ago</small>
                     </div>
                     <div class="card-body">
                       <p class="card-text">${data['message']}</p>
                     </div>
                    </div>
                  </div>`;
    var messages = document.getElementById('messages');
    messages.insertAdjacentHTML('beforeend', message);
    }
  },

  speak: function(message, message_type) {
    return this.perform('speak', {message: message, message_type: message_type});
  }
});

//message送信
  $(document).on('click', '#message_button', function(){
    const messageType = $('#messages').data('message-type');
    const messageVal = $('#message_field').val();
    chatChannel.speak(messageVal, messageType);
    document.getElementById('message_field').value = '';
    $('#message_field').focus();
  });
});