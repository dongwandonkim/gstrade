import consumer from './consumer';

consumer.subscriptions.create('RoomChannel', {
  connected() {
    // Called when the subscription is ready for use on the server
    //console.log('window', window.location.href);
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    setItemInfoToNewCard(data);
  },
});

function setItemInfoToNewCard(data) {
  const card = $('#card-to-clone').clone();
  card
    .find('#card-item-name')
    .html(data.item_info.name)
    .attr('href', '/items/' + data.item_info.id);

  card
    .find('#card-item-quantity')
    .html('개수: ' + data.registered_item.quantity);
  card.find('#card-item-price').html('가격: ' + data.registered_item.price);
  card.find('#card-item-server').html('서버: ' + data.server_info);
  card.find('#card-item-id').html(data.user_info.in_game_id);

  if (data.registered_item.buy_sell == false) {
    card
      .find('#card-item-buysell')
      .attr('class', 'badge bg-danger')
      .html('판매');
    card.prependTo('#sell_update');
  } else {
    card.prependTo('#buy_update');
  }
}
