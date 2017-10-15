// // button.click back up as a fetch version
//
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

    // For deleting answers/questions
    var eventHandlers = {
      '.deletebutton': serverAPI('/delete'),
      '.answerbutton': serverAPI('/answer'),
    };

    function addClickers() {
      Object.keys(eventHandlers).forEach(function (key) {
        var $button = $(key);
        $button.off('click'); // remove old clickers
        $button.click(eventHandlers[key]) // and readd
      });
    }

    addClickers();
    

    // Returns an event handler that makes a serverAPI request passing arguments
    // Sometimes not all the arguments are necessary
    function serverAPI(link) {
      return(function (ev) {
        var $button = $(ev.currentTarget);
        var textarea = $($button.parent().parent().find('textarea')).val()
        var hidden = $button.parent().find('input[type="hidden"]').val();
        return($.post(link, {
          args: hidden,
          content: textarea,
        }, function (data) {
          $('#refresh').html(data);
          addClickers(); // Newly added elements won't have the click handler
        }).fail(function (err) {
          console.error(err);
        }));
      });
    }
  });
})();