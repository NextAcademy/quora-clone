$(document).ready(function() {

  $('#ask_question').on('submit', function(event) {
    event.preventDefault()
    $.ajax({
      url: '/questions',
      method: 'post',
      data: $(this).serialize(),

      success: function(data) {
        res = JSON.parse(data)
        
        $('<div class="panel panel-default"><div class="panel-heading"><b>'+ res.subject +'</b></div><div class="panel-body">'+ res.description +'</div><table><tr><td><button id="voteBtn" class="btn btn-info"><i class="fa fa-thumbs-up">&ensp;'+ res.votes +'</i></button></td><td><form style="margin-bottom: -3px" action="/questions/'+ res.id +'" method="post"><input id="hidden" type="hidden" name="_method" value="delete"><button type="submit" id="deleteBtn" class="btn btn-danger"><i class="fa fa-trash"></i></button></form></td></tr></table></div>').hide().insertAfter('#ask_question').fadeIn(1000);
      }
    })
  })
  
  $('#voteBtn i').click(function(e) {
    var voted = $(this).data('clicks');
    if (voted) {
      $('#voteBtn:focus').removeAttr('style')
      ele = $(e.target)
      vote = parseInt(ele.text()) - 1
      ele.text('  ' + vote)
    } else {
      $('#voteBtn:focus').css({'background':'#428bda', 'border-color':'#428bda', 'font-size':'18px'})
      ele = $(e.target)
      vote = parseInt(ele.text()) + 1
      ele.text('  ' + vote)
    }
    $(this).data("clicks", !voted);
  })
  
})
