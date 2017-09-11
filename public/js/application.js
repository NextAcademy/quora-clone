console.clear();

$(document).ready(function () {
    $('#question-form').submit(function (event) {
        event.preventDefault();
        ajaxShowQuestion();
    });

    $('#answer-form').submit(function (event) {
        event.preventDefault();
        ajaxShowAnswer();
    });

});

function ajaxShowQuestion() {
    $.ajax({
        url:'/questions/create',
        method:'post',
        data:$('#question-form').serialize(),
        format:'json',
        error:function (response) {
            console.log(response);
        },
        success:function (response) {
            response = JSON.parse(response);
            console.log(response);
            if(response.flag){
                displayErrorModal(response);
            }else{
                var card = createQuestionCard(response);
                $('.qeustions-container').prepend(card);
            }

        }
    })
}

function ajaxShowUserAnswers() {
    var userId = $('[user-id]').attr('user-id');
    if (userId){
        $.ajax({
            url:`/users/${userId}/answers`,
            method:'get',
            format:'json',
            error: function (response) {
                console.log(response);
            },
            success: function (response) {
                response = JSON.parse(response);

                if(response.flag){
                    displayErrorModal(response);
                }else{
                    $('.user-questions-container row').remove();
                    $('.user-answers-container row').remove();
                    console.log('testing');
                    for(var i=0; i < response.length;i++){
                        $('.user-answers-container').prepend(createUserAnsQuesEle(response[i]));
                    }
                }
            }
        })
    }else{
        var error = {UserID:['Must provide user ID to show info']};
        displayErrorModal(error);
    }

}

function ajaxShowUserQuestions() {
    var userId = $('[user-id]').attr('user-id');
    if (userId){
        $.ajax({
            url:`/users/${userId}/questions`,
            method:'get',
            format:'json',
            error: function (response) {
                console.log(response);
            },
            success: function (response) {
                response = JSON.parse(response);

                if(response.flag){
                    displayErrorModal(response);
                }else{
                    $('.user-questions-container row').remove();
                    $('.user-answers-container row').remove();
                    for(var i=0; i<response.length;i++){
                        $('.user-questions-container').prepend(createUserAnsQuesEle(response[i]));
                    }
                }
            }
        })
    }else{
        var error = {UserID:['Must provide user ID to show info']};
        displayErrorModal(error);
    }

}

function ajaxShowAnswer() {
    quesId = $('[quesid]').attr('quesid');
    $.ajax({
        url:`/questions/${quesId}/answers/create`,
        method:'post',
        data:$('#answer-form').serialize(),
        format:'json',
        error: function (response) {
            displayErrorModal(response);
        },
        success:function (response) {
            response = JSON.parse(response);

            $('#answer-modal').modal('hide');

            if (response.error){
                displayErrorModal(response);
            }else{
                //append the answer to the screen
                $('.answer-container').prepend(
                    `
                    <row answerid="${response.id}">
                        <p class="mb-sm-1">${response.detail}</p>
                        <a href="/users/${response.user_id}">${response.user}</a>
                    </row>
                    `
                );
            }
        }

    })
}

function createQuestionCard(data) {
    var container = document.createDocumentFragment();

    var wrapper = document.createElement('div');

    // ES 6 is in place for the temp literal string back tick
    wrapper.innerHTML = `
        <div class="row">
            <div class="card float-left" style="width: 80%;">
                <div class="card-body p-sm-3">
                
                    <a href="/questions/${data.id}">
                        <h4 class="card-title">${data.header}</h4>
                    </a>
                    
                    <a href="/users/${data.user_id}">
                        <h6 class="card-subtitle mb-2 text-muted">${data.user}</h6>
                    </a> 
                    <p class="card-text ques-detail">${data.detail}</p>
                </div>
            </div>
        </div>
        `;

    while (wrapper.childNodes[0]) {
        container.appendChild(wrapper.childNodes[0]);
    }
    return container.firstElementChild;
}

function createUserAnsQuesEle(data) {
    var html=`
    <row>
        <h4 class="question-header">
            ${data.header}
            </h4>
        <p class="question-detail">
            ${data.detail}
        </p>
        <hr>
    </row>
    `;

    return html;

}

function displayErrorModal(data) {
    //display the error message with modal
    $('#error-modal p').remove();

    for (var key in data){
        //ignore the flag key
        if(key!=='flag'){
            $('#error-modal .modal-body').append(
                `<p>${key}: ${data[key][0]}</p>`
            )
        }
    }
    $('#error-modal').modal('show');
}


