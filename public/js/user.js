(function () {
  'use strict';

  $(document).ready(function () {
    var $body = $(document.body);
    $('#askquestion').click(function () {
      var $cover = $('<div>').addClass('cover');
      var $button, $content;
      var $askComponent =
        $('<div class="ask">')
          .append($('<div class="container">')
            .append($content = $('<textarea>'))
          )
          .append($button = $('<div><input type="submit">'));

      function removeAskBox() {
        $cover.remove();
        $askComponent.remove();
      }
  
      $button.click(function (ev) {
        $.ajax({ // Submit message
          url: '/askquestion',
          method: 'POST',
          data: { content: $content.val() },
          success: function (msg) {
            //if (receive error) // When have time to do error handling
            removeAskBox();
          }
        })
      });
      
      $cover.click(removeAskBox);

      $body.append($cover);
      $body.append($askComponent);
    });
  });
})();