
$(document).ready(function(){
		
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
		var x = $target.parent().find('.question_id_upvote').val();

		$.post("/upvote_question", 
			{ question_id: x
			},
			function (data) {
				if (data == "error") {
					window.location.assign("http://localhost:9393/")
				} else {
				$target.parent().find('.vote_counter').text(data);
					$.post("/vote_status",
						{ question_id: x
						},
						function (y) {
							if 	(y == "1") {
								$target.css("background", "grey")
								$target_downvote.css("background", "white") 
							} else if (y == "0") {
								$target.css("background", "white")
								$target_downvote.css("background", "white") 
							} else if (y == "-1") {
								$target.css("background", "white")
								$target_downvote.css("background", "grey") 
							};
						}
					);		
				}
			}
		);
	});


	$('.downvote_button').click(function(e){
		var $target = $(e.currentTarget)
		var $target_upvote = $target.parent().find('.upvote_button')
		var x = $target.parent().find('.question_id_upvote').val();
		var y = $target.parent().find('.counter_state').val();

		$.post("/downvote_question", 
			{ question_id: x
			},
			function(data){ 
				if (data == "error") {
					window.location.assign("http://localhost:9393/")
				} else {	
				$target.parent().find('.vote_counter').text(data)
						$.post("/vote_status",
						{ question_id: x
						},
						function (y) {
							console.log(y)
							if 	(y == "1") {
								$target.css("background", "white")
								$target_upvote.css("background", "grey") 
							} else if (y == "0") {
								$target.css("background", "white")
								$target_upvote.css("background", "white") 
							} else if (y == "-1") {
								$target.css("background", "grey")
								$target_upvote.css("background", "white") 
							};
						}
					);	
				};
			}
		);
	});
});
