console.clear();

$(document).ready(function () {
    $('#question-form').submit(function (event) {
        event.preventDefault();
        ajaxShowQuestion();
    })
});

function ajaxShowQuestion() {
    $.ajax({
        url:'/questions/create',
        method:'post',
        data:$('#question-form').serialize(),
        format:'json',
        error:function (response) {
            console.log(response)
        },
        success:function (response) {
            response = JSON.parse(response);
            console.log(response);
            var card = createCard(response);
            $('.qeustions-container').prepend(card);
        }
    })
}


function createCard(data) {
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