function ajaxQuestionVote() {
	$('.question-upvote-form, .question-downvote-form').submit(function(event) {
		event.preventDefault();
		$.ajax({
			url: '/question_votes',
			method: 'POST',
			data: $(this).serialize(),
			success: function(data) {
				var json = JSON.parse(data);

				// Remove old error messages if any
				$(".error").remove();

				// Update vote count
				var voteCountSelector = ".question-vote-count-" + json.question_id;
				var voteFormSelector = ".question-vote-form-" + json.question_id;

				if ($.isNumeric(json.vote)) {
					previousVoteCount = $(voteCountSelector).text();
					$(voteCountSelector).text(parseInt(previousVoteCount) + json.vote);
				} else {
					$(voteFormSelector).after("<p class='error'>Invalid input! Please check your input.</p><ul><li class='error'>"+ json.message.vote[0] +"</li></ul>")
				}
			},
			error: function(jqXHR, textStatus, errorThrown) {
				console.log(textStatus, errorThrown);
			}
		});
	});
}

function ajaxAnswerVote() {
	$('.answer-upvote-form, .answer-downvote-form').submit(function(event) {
		event.preventDefault();
		$.ajax({
			url: '/answer_votes',
			method: 'POST',
			data: $(this).serialize(),
			success: function(data) {
				var json = JSON.parse(data);

				// Remove old error messages if any
				$(".error").remove();

				// Update vote count
				var voteCountSelector = ".answer-vote-count-" + json.answer_id;
				var voteFormSelector = ".answer-vote-form-" + json.answer_id;

				console.log(json)
				console.log($(voteCountSelector).text())
				console.log(json.vote)

				if ($.isNumeric(json.vote)) {
					previousVoteCount = $(voteCountSelector).text();
					$(voteCountSelector).text(parseInt(previousVoteCount) + json.vote);
				} else {
					$(voteFormSelector).after("<p class='error'>Invalid input! Please check your input.</p><ul><li class='error'>"+ json.message.vote[0] +"</li></ul>")
				}
			},
			error: function(jqXHR, textStatus, errorThrown) {
				console.log(textStatus, errorThrown);
			}
		});
	});
}

$(document).ready(function() {
	ajaxQuestionVote();
	ajaxAnswerVote();
})