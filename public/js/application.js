function ajaxQuestionVote() {
	$('.question-upvote-form, .question-downvote-form').submit(function(event) {
		event.preventDefault();
		$.ajax({
			url: '/question_votes',
			method: 'POST',
			data: $(this).serialize(),
			success: function(data) {
				var question_votes = JSON.parse(data);

				// Remove old error messages if any
				$(".error").remove();

				// Update vote count
				var voteCountSelector = ".question-vote-count-" + question_votes.question_id;

				if ($.isNumeric(question_votes.vote)) {
					$(voteCountSelector).text(question_votes.vote);
				} else {
					$(".question-vote-form").after("<p class='error'>Invalid input! Please check your input.</p><ul><li class='error'>"+ question_votes.vote[0] +"</li></ul>")
				}

				console.log(question_votes)
				console.log(question_votes.vote)
				console.log($.isNumeric(question_votes.vote))
			},
			error: function(jqXHR, textStatus, errorThrown) {
				console.log(textStatus, errorThrown);
			}
		});
	});
}

$(document).ready(function() {
	ajaxQuestionVote();
})