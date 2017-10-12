function log(){
    var form = $('#signup-form');
    form.on('submit',function(formSubmissionEvent){
        formSubmissionEvent.preventDefault();


    $.ajax({
        url: form.attr('action'),
        method: form.attr('method'),
        data: form.serialize(),
        dataType: 'JSON',
        success: function(response) {
            if (response.id) {
                $('#yay').append('Successful! You now have an account with Quora!')
               } else {
                $('#sorry').append('Sorry, please check for these errors:' + response)
               }

        }

    })

    })
}



document.addEventListener("DOMContentLoaded",log);