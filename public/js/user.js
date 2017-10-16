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
    // Hide the form when first loading in and add the appropriate reveals
    var $askForm = $('#ask-popup'); 
    $askForm.hide();
    $('#askquestion').click(function () { $askForm.show(); });
    $('#ask-cover').click(function () { $askForm.hide(); });

    $('#askbutton').click(function (ev) {
      function redirect() { 
        window.location.replace("/");
      };

      // Redirect to main page if asking a question
      var handler = (window.location.pathname === '/')
        ? serverAPI('/question_ask').then(function () { $askForm.hide(); })
        : serverAPI('/question_ask', redirect);
      handler(ev);
    });

    // Separating into own structure to support adding/removing handles
    var eventHandlers = {
      '.answerbutton': (window.location.pathname.startsWith('/question/'))
        ? serverAPI('/answer_reply')
        : serverAPI('/answer_reply',
          function (textarea, hidden, data) {
            // redirect to the question page
            window.location.replace("/question/" + hidden);
          }),

      '.deletebutton': serverAPI('/delete'),

      '.signaledit': function (ev) {
        var $hidden = $(ev.currentTarget).parent().find('input[type="hidden"]');
        var $main = $(document.getElementById($hidden.val()))
        $main.find('.edit').toggle();
        $main.find('span').toggle();
      },

      '.editbutton': serverAPI('/edit'),
    };
    addClickers(); // Add the handlers initially
    
    // Apply all the click handlers, since adding remove requires
    function addClickers() {
      Object.keys(eventHandlers).forEach(function (key) {
        var $button = $(key);
        $button.off('click'); // remove old clickers
        $button.click(eventHandlers[key]) // and readd
      });
    }


    // Returns an event handler that makes a serverAPI request passing arguments
    // Sometimes not all the arguments are necessary
    function serverAPI(link, callback) {
      return(function (ev) {  
        var $button = $(ev.currentTarget);
        var $textarea = $($button.parent().parent().find('textarea'));
        var hidden = $button.parent().find('input[type="hidden"]').val();
        var success = (callback != undefined)
          ? function (data)
            {
              return callback.call(null, $textarea, hidden, data);
            }

          : function (data)
            {
              $('#refresh').html(data); // Refresh the page
              $textarea.val('');
              addClickers(); // Added elements don't have the click handler
            };

        return(jQuery
          .post(link, { args: hidden, content: $textarea.val() }, success)
          .fail(console.error)
        );
      });
    }
  });
})();