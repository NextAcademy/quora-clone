
$(document).ready(function(){

	$('.upvote_button').click(function(e){
		var $target = $(e.currentTarget);


		var x = $target.prev().val();
		$.post("/upvote_question", 
			{ question_id: x
			},
			function (data) {
				$target.parent().find('.vote_counter').text(data);
				//$('.vote_counter').text(data);
			}
		);
	});


	$('.downvote_button').click(function(e){
		var x = $(e.currentTarget).prev().val()

		$.post("/downvote_question", 
			{ question_id: x
			},
			function(data){ 
				$('.vote_counter').text(data)
			}
		);
	});
});
