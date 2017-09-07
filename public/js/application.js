$(document).ready(function(){
    console.clear();
    $('#signup-btn').on('click', function () {
        $('#signup-form').attr('action', '/signup');
        $('#signup-form').submit();
    });

    $('#login-btn').on('click', function () {
        console.log('user trying to login');
        $('#signup-form').attr('action', '/login');
        $('#signup-form').submit();
    })

});