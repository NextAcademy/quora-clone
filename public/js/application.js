// $(document).ready(function() {
//
//   addCookieBtn.addEventListener("click", addCookie);
//
$(document).ready(function(){
    $(".header-btns").hover(function(){
        $(this).css("background-color", "#C4C3C3");
    });

    $('#user-form').submit(function(e){
      $.ajax({
        url: '/login',
        method: 'POST',
        data: $(this).serialize(),
        success: function(data) {
          // debugger
          data = JSON.parse(data)
          if(data.message == "Nope") {
            $('#ajax-show').append(`<p>Your Email or Password is invalid ('not match')</p>`)
          }
        }
      });
    });
    e.preventDefault()
  });
});
