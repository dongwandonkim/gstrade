$(document).on('turbolinks:load', function () {
  $('.page-item-search')
    .autocomplete({
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
        window.location = '/items/' + ui.item.setData;
      },
      change: function (event, ui) {
        if (ui.item == null || ui.item == undefined) {
          $(this).val('');
          $(this).after(
            '<div class="error text-danger">존재하지않는 아이템입니다</div>'
          );
        }
      },
      //검색하기위한 최소 단어 입력
      minLength: 1,
    })
    .focus(function (e) {
      e.preventDefault();
      $(this).parent().find('.error').remove();
      return false;
    });
});
