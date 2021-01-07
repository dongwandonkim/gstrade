document.addEventListener('turbolinks:load', function () {
  var scrollTopBtn = document.querySelector('#scroll-to-top');
  scrollTopBtn.addEventListener('click', scrollToTop);
});

function scrollToTop() {
  window.scrollTo({ top: 0, behavior: 'smooth' });
}
