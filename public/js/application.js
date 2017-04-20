//////////////////////		QUESTION		/////////////////////////

$(document).ready(function(e){
	// do stg when form is submitted (put in form class from HTML)
	$('.q-upvote-form').submit(function(e) {
		// prevent the default behavior of the submit button
		e.preventDefault();

		// This is needed to embed Ruby into JS (look at the HTML erb file)
		// Go into the form with .q-upvote-form class, look for "data-<xxx>". In this case, xxx is 'qid'
		var q_id = $(e.target).data('qid')

		console.log('/questions/' + q_id + '/upvotes')
		// Get AJAX started
		$.ajax({
			url: '/questions/' + q_id + '/upvotes', 
			method: "post",
			// data: $(this).serialize(), <-- not needed because this is to grab info (eg. text) from form, but this form has no input params

			dataType: "json", //--> make sure your RETURN returns json (look at controller)

			// TO AVOID SPAMMING
			beforeSend: function(data){
				$(e.target).find('input').attr('disabled', true)
			},

			complete: function(data){
				$(e.target).find('input').attr('disabled', false)
			},

			//get DATA from the controller's final return
			success: function(data) {
				// debugger
				console.log(data)
				// responseText is a method for data
				$(e.target).find('input').attr('value', 'Upvote | ' + data.upvote)
				$(e.target).siblings().find('input').attr('value', 'Downvote | ' + data.downvote)

				// this is not applicable because you've repeated Upvotes for different questions in ONE page!
			}
		})
	})

	$('.q-downvote-form').submit(function(e){
		e.preventDefault();

		var q_id = $(e.target).data('qid')
		console.log('/questions/' + q_id + '/downvotes')

		$.ajax({
			url: "/questions/" + q_id + "/downvotes", 
			method: "post",
			dataType: "json",

			beforeSend: function(data) {
				$(e.target).find('input').attr('disabled', true)
			},

			complete: function(data) {
				$(e.target).find('input').attr('disabled', false)
			},

			success: function(data) {
				console.log(data)
				$(e.target).find('input').attr('value', 'Downvote | ' + data.downvote)
				$(e.target).siblings().find('input').attr('value', 'Upvote | ' + data.upvote)
			}
		})
	})
//////////////////////		ANSWER		/////////////////////////

	$('.a-upvote-form').submit(function(e) {
		e.preventDefault();
		
		var q_id = $(e.target).data('qid')
		var a_id = $(e.target).data('aid')

		$.ajax({
			url: "/questions/" + q_id + "/answers/" + a_id + "/upvotes",
			method: "post",
			dataType: "json",

			beforeSend: function(data) {
				$(e.target).find('input').attr('disabled', true)
			},

			complete: function(data) {
				$(e.target).find('input').attr('disabled', false)
			},

			success: function(data) {
				$(e.target).find('input').attr('value', 'Upvote | ' + data.upvote)
				$(e.target).siblings().find('input').attr('value', 'Downvote | ' + data.downvote)
			}
		})
	})

		$('.a-downvote-form').submit(function(e) {
		e.preventDefault();

		var q_id = $(e.target).data('qid')
		var a_id = $(e.target).data('aid')

		$.ajax({
			url: "/questions/" + q_id + "/answers/" + a_id + "/downvotes",
			method: "post",
			dataType: "json",

			beforeSend: function(data) {
				$(e.target).find('input').attr('disabled', true)
			},

			complete: function(data) {
				$(e.target).find('input').attr('disabled', false)
			},

			success: function(data) {
				$(e.target).find('input').attr('value', 'Downvote | ' + data.downvote)
				$(e.target).siblings().find('input').attr('value', 'Upvote | ' + data.upvote)
			}
		})
	})
})





/*
LESSON 1
========
If you have MULTIPLE points that has similar action, e.g. Index page has MULTIPLE questions thus have MULTIPLE upvotes, use (e.target) to listen on the particular action

==> $(e.target).find('input').attr('value', 'Upvote | ' + data)

Else, you can use this 

==>'$('#upvote_button').text(data)'


LESSON 2
========
In JS, to make into a string

'/questions/' + q_id + '/upvotes'  ==> the quotes must be the same
"/questions/" + q_id + "/downvotes"


LESSON 3
========
With AJAX, you can disregard the REDIRECTS in your controller files

*/
