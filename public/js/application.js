$(document).ready(function(){

	// $('.button').on('click', function(e){
	// 	var target = $(e.target).parent().siblings().last()
	// 	var num = parseInt(target.text()) + 1
	// 	//target.text is the click counter number
	// 	target.text(num)
	// })

	//var question_id = e.target.value

	$('.question_upvote').submit(function(event){
		
		event.preventDefault();
		//to prevent it form going to sever to find normal routes
		var q_id = $(event.target).data('qid');
		var controller_url = '/question/' + q_id + '/upvote';
		//console.log(controller_url)
		$.ajax({
			url: controller_url,
			method: 'post',
			//data: $(this).serialize(), //to pass the input text bos to ajax, to pass the form
			dataType: 'json', //what is the datatype am i getting back, to get back as a json format, ruby hash in js is called json from static.rb

			beforeSend: function(data) {
				$(event.target).find('input').attr('disabled', true);
			},

			complete: function(data) {
				$(event.target).find('input').attr('disabled', false);
			},

			success: function(data){
				console.log("YAY");
				console.log(data);
				//debugger
				// button_id = "button" + question_id
				 $(event.target).find('input').attr('value', 'Upvote | ' + data);
				//
				// debugger
			},

			error: function(data){
				console.log('OPPS ERROR!');
				console.log(data);
				//$('#flash').html(data.responseText);
				
			}
		})
	})

	$('.question_downvote').submit(function(event){
		
		event.preventDefault();
		//to prevent it form going to sever to find normal routes
		var q_id = $(event.target).data('qid');
		var controller_url = '/question/' + q_id + '/downvote';
		//console.log(controller_url)
		$.ajax({
			url: controller_url,
			method: 'post',
			//data: $(this).serialize(), //to pass the input text bos to ajax, to pass the form
			dataType: 'json', //what is the datatype am i getting back, to get back as a json format, ruby hash in js is called json from static.rb

			beforeSend: function(data) {
				$(event.target).find('input').attr('disabled', true);
			},

			complete: function(data) {
				$(event.target).find('input').attr('disabled', false);
			},


			success: function(data){
				console.log("YAY");
				console.log(data);
				//debugger
				// button_id = "button" + question_id
				$(event.target).find('input').attr('value', 'Downvote | ' + data);
				//$(e.target).find('input').attr('value', 'Downvote | ' + data.downvote)
	            //$(e.target).siblings().find('input').attr('value', 'Upvote | ' + data.upvote)
				// debugger
			},

			error: function(data){
				console.log('OPPS ERROR!');
				console.log(data);
				//$('#flash').html(data.responseText);
				
			}
		})
	})

	$('.answer_upvote').submit(function(event){
		
		event.preventDefault();
		//to prevent it form going to sever to find normal routes
		var q_id = $(event.target).data('qid');
		var a_id = $(event.target).data('aid');
		var controller_url = '/question/' + q_id + '/answer/' + a_id + '/upvote';
		console.log(controller_url)
		$.ajax({
			url: controller_url,
			method: 'post',
			//data: $(this).serialize(), //to pass the input text bos to ajax, to pass the form
			dataType: 'json', //what is the datatype am i getting back, to get back as a json format, ruby hash in js is called json from static.rb

			beforeSend: function(data) {
				$(event.target).find('input').attr('disabled', true);
			},

			complete: function(data) {
				$(event.target).find('input').attr('disabled', false);
			},

			success: function(data){
				console.log("YAY");
				console.log(data);
				//debugger
				// button_id = "button" + question_id
				 $(event.target).find('input').attr('value', 'Upvote | ' + data);
	
				// debugger
			},

			error: function(data){
				console.log('OPPS ERROR!');
				console.log(data);
				//$('#flash').html(data.responseText);
				
			}
		})
	})


})