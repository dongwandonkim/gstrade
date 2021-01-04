import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = ['entries', 'pagination'];

  scroll() {
    let next_page = this.paginationTarget.querySelector("a[rel='next']");
    //console.log(next_page);
    if (next_page == null) {
      return;
    }
    let url = next_page.href;
    //console.log(url);
    var body = document.body,
      html = document.documentElement;

    var height = Math.max(
      body.scrollHeight,
      body.offsetHeight,
      html.clientHeight,
      html.scrollHeight,
      html.offsetHeight
    );

    if (window.pageYOffset >= height - window.innerHeight) {
      this.loadMore(url);
      //console.log('hello', $);
    }
  }

  loadMore(url) {
    $.ajax({
      type: 'GET',
      url: url,
      dataType: 'json',
      success: (data) => {
        //console.log(data);
        this.entriesTarget.insertAdjacentHTML('beforeend', data.entries);
        this.paginationTarget.innerHTML = data.pagination;
      },
    });
  }
}
