(function () {
  'use strict';

  $(document).ready(function () {
    $('#askquestion').click(function () {
      var $cover = $('<div>').addClass('cover');
      //console.log($cover);

      var $button, $content;
      var $box =
        $('<div class="ask">')
          .append($('<div class="container">')
            .append($content = $('<textarea>'))
          )
          .append($button = $('<div><input type="submit">'));
  
      $button.click(function (a) {
        $.ajax({
          url: '/askquestion',
          method: 'POST',
          data: { content: $content.val() },
          success: function (msg) {
            $(document.body).remove($cover).remove($box);
          }
        })
      });

      $(document.body).append($cover);
      $(document.body).append($box);
    });
  });
})();