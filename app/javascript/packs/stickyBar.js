document.addEventListener('turbolinks:load', function () {
  // When the event DOMContentLoaded occurs, it is safe to access the DOM

  // When the user scrolls the page, execute the Function
  window.addEventListener('scroll', stickyBar);

  // Get the navbar
  var searchbar = document.querySelector('#sticky-search');
  //console.log(searchbar);
  //Get the offset position of the navbar
  var sticky = searchbar.offsetTop;
  console.log(sticky);

  // Add the sticky class to the navbar when you reach its scroll position. Remove "sticky" when you leave the scroll position
  function stickyBar() {
    if (window.pageYOffset > sticky) {
      console.log(window.pageYOffset);
      searchbar.classList.add('sticky');
    } else {
      searchbar.classList.remove('sticky');
    }
  }
});
