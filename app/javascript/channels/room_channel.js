import consumer from './consumer';

consumer.subscriptions.create('RoomChannel', {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    if (data.registered_item.buy_sell == true) {
      console.log(data);
      $('#buy_update').prepend(
        '<div class="buy_update">' + data.item_info.name + '</div>'
      );
    } else {
      $('#sell_update').prepend(
        '<div class="sell_update">' + data.item_info.name + '</div>'
      );
    }
  },
});
