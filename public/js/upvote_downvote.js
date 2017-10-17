
$(document).ready(function(){
	document.querySelectorAll(".answer_counter_state").forEach(function (elem) {
	  	if ($(elem).val() == 1) {
				$(elem).parent().find('.answer_upvote_button').css("background", "grey")
			} else if ($(elem).val() == '0') {
				$(elem).parent().find('.answer_upvote_button').css("background", "white")
				$(elem).parent().find('.answer_downvote_button').css("background", "white")
			} else if ($(elem).val() == -1) 
				$(elem).parent().find('.answer_downvote_button').css("background", "grey")
	});

	$('.answer_upvote_button').click(function(e){
		var $target = $(e.currentTarget);
		var $target_downvote = $target.parent().find('.answer_downvote_button')
		var y = $target.parent().find('.answer_id').val();
		var $counter=".vote_counter_answer"

		upvote("/upvote_answer", y, $target, $target_downvote, $counter, "/vote_status_answer")
	});


	$('.answer_downvote_button').click(function(e){
		var $target = $(e.currentTarget)
		var $target_upvote = $target.parent().find('.answer_upvote_button')
		var y = $target.parent().find('.answer_id').val();
		var $counter=".vote_counter_answer"
		
		downvote("/downvote_answer", y, $target, $target_upvote, $counter, "/vote_status_answer")
	});

	document.querySelectorAll(".counter_state").forEach(function (elem) {
		if ($(elem).val() == 1) {
			$(elem).parent().find('.upvote_button').css("background", "grey")
		} else if ($(elem).val() == '0') {
			$(elem).parent().find('.upvote_button').css("background", "white")
			$(elem).parent().find('.downvote_button').css("background", "white")
		} else if ($(elem).val() == -1) 
			$(elem).parent().find('.downvote_button').css("background", "grey")
	});

	$('.upvote_button').click(function(e){
		var $target = $(e.currentTarget);
		var $target_downvote = $target.parent().find('.downvote_button')
		var y = $target.parent().find('.question_id').val();
		var $counter = '.vote_counter'

		upvote("/upvote_question", y, $target, $target_downvote, $counter, "/vote_status")
	});

	$('.downvote_button').click(function(e){
		var $target = $(e.currentTarget);
		var $target_downvote = $target.parent().find('.upvote_button')
		var y = $target.parent().find('.question_id').val();
		var $counter = '.vote_counter'

		downvote("/downvote_question", y, $target, $target_downvote, $counter, "/vote_status")
	});
});





function upvote(link, id_of_question_answer, $button, $opposite_button, $vote_counter, $link_2){
	$.post(link, 
		{ question_answer_id: id_of_question_answer
		},
		function (data) {
			if (data == "error") {
				window.location.assign("http://localhost:9393/")
			} else {
			$button.parent().find($vote_counter).text(data);
				$.post($link_2,
					{ question_answer_id: id_of_question_answer
					},
					function (y) {
						if 	(y == "1") {
							$button.css("background", "grey")
							$opposite_button.css("background", "white") 
						} else if (y == "0") {
							$button.css("background", "white")
							$opposite_button.css("background", "white") 
						} else if (y == "-1") {
							$button.css("background", "white")
							$opposite_button.css("background", "grey") 
						};
					}
				);		
			}
		}
	);
};

function downvote(link, id_of_question_answer, $button, $opposite_button, $vote_counter, $link_2){
	$.post(link, 
		{ question_answer_id: id_of_question_answer
		},
		function(data){ 
			if (data == "error") {
				window.location.assign("http://localhost:9393/")
			} else {	
			$button.parent().find($vote_counter).text(data)
					$.post($link_2,
					{ question_answer_id: id_of_question_answer
					},
					function (y) {
						if 	(y == "1") {
							$button.css("background", "white")
							$opposite_button.css("background", "grey") 
						} else if (y == "0") {
							$button.css("background", "white")
							$opposite_button.css("background", "white") 
						} else if (y == "-1") {
							$button.css("background", "grey")
							$opposite_button.css("background", "white") 
						};
					}
				);	
			};
		}
	);
}
