
$(document).ready(function(){
	$('.upvote_button').click(function(e){
		var $target = $(e.currentTarget);
		var x = $target.parent().find('.question_id_upvote').val();

		console.log($target.parent().find('.counter_state').val())


		$.post("/upvote_question", 
			{ question_id: x
			},
			function (data) {
				if (data == "error") {
					window.location.assign("http://localhost:9393/")
				} else {
				$target.parent().find('.vote_counter').text(data);
				}
			}
		);
	});


	$('.downvote_button').click(function(e){
		var $target = $(e.currentTarget)
		var x = $target.parent().find('.question_id_upvote').val();

		$.post("/downvote_question", 
			{ question_id: x
			},
			function(data){ 
				if (data == "error") {
					window.location.assign("http://localhost:9393/")
				} else {	
				$target.parent().find('.vote_counter').text(data)
				};
			}
		);
	});
});
