$(document).on('turbolinks:load', function () {
  $('.item-search')
    .autocomplete({
      // source: function (request, response) {
      //   //console.log(request);
      //   $.getJSON('/items.json', function (data) {
      //     //console.log(data);
      //     response(
      //       $.map(data, function (item) {
      //         return {
      //           label: item.name,
      //           value: item.name,
      //         };
      //       })
      //     );
      //   });
      // },
      source: function (request, response) {
        $.getJSON('/items.json', function (data) {
          response(
            $.map(data, function (obj, key) {
              var name = obj.name.toUpperCase();
              //console.log(obj);
              //검색하려는 단어의 위치가 -1이 같지않다면, (-1은 데이터가없다는 소리)
              if (name.indexOf(request.term.toUpperCase()) != -1) {
                return {
                  label: obj.name, // Label for Display
                  value: obj.name, // Value
                  setData: obj.id,
                };
              } else {
                return null;
              }
            })
          );
        });
      },
      select: function (event, ui) {
        //console.log(ui.item.setData);
        //히든필드에 item.id값을 넣음
        $('#itemHidden').val(ui.item.setData);
      },
      //검색하기위한 최소 단어 입력
      minLength: 1,
    })
    .focus(function () {
      //$(this).autocomplete('search', $(this).val());
      return false;
      //event.preventDefault();
    });
});

//prevent submission of forms when pressing Enter key in a text input
$(document).on(
  'keypress',
  ':input:not(textarea):not([type=submit])',
  function (e) {
    if (e.which == 13) e.preventDefault();
  }
);
