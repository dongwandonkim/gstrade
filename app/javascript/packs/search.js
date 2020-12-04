$(document).on('turbolinks:load', function () {
  $('#city').autocomplete({
    source: function (request, response) {
      $.getJSON('/items.json?term=' + request.term, function (data) {
        response(
          $.map(data, function (value, key) {
            return {
              label: value.name,
              value: value.id,
            };
          })
        );
      });
    },

    select: function (event, ui) {
      console.log(ui.item.value);
      //set value to item id
      var eee = ui.item.value;
    },

    focus: function (event, ui) {
      return false;

      //event.preventDefault();
    },
  });
});
