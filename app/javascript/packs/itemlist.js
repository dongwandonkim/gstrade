// document.addEventListener('DOMContentLoaded', () => {
//   const rows = document.querySelectorAll('#item-list[data-href]');
//   console.log(rows);
//   rows.forEach((row) => {
//     row.addEventListener('click', () => {
//       window.location.href = row.dataset.href;
//     });
//   });
// });

// items/index.html.erb clickable row
$(document).on('click', '#item-list[data-href]', function () {
  window.location.href = this.dataset.href;
});
