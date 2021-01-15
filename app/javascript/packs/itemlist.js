// items/index.html.erb clickable row
$(document).on('click', '#item-list[data-href]', function () {
  window.location.href = this.dataset.href;
});
