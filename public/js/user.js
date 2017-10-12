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
        // fetch('/askquestion', {
        //   method: 'POST',
        //   body: { content: $content.val() },
        //   headers: new Headers({
        //     'Content-Type': 'application/json'
        //   })
        // }).then(function (response) {
        //   console.log(response);
        //   return response.text();
        // }).then(function (text) {
        //   console.log('next', text);
        //   removeAskBox();
        // }).catch(function (err) {
        //   console.log('error: ', err);
        // });
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