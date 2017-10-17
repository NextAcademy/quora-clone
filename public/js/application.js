$(document).ready(function() {
	setupvotingbuttons();
	truncatinglength();	
});


function setupvotingbuttons(){
	$(".upvotebutton").on( "click", function() {
		var qid = $(this).data('qid');	
		$.ajax({
			url: '/homepage/questionvote', 
			method: 'POST',
			data: {qid: qid, type: "up"},
			dataType: 'json',
			context: this,
			success: function(data){	
				$(this).parent().find(".totalvotes").text(data.votes);
			}
			, error: function(data){
				alert(data.responseText);
			}
    }); // end of function .ajax
	});

	$(".downvotebutton").on( "click", function() {
		var qid = $(this).data('qid');	
		$.ajax({
			url: '/homepage/questionvote', 
			method: 'POST',
			data: {qid: qid, type: "down"},
			dataType: 'json',
			context: this,
			success: function(data){
				$(this).parent().find(".totalvotes").text(data.votes);
			}
			, error: function(data){
				alert(data.responseText);
			}
    }); // end of function .ajax
	});


	$(".upvoteanswer").on( "click", function() {

		var aid = $(this).data('aid');
		$.ajax({
			url: '/homepage/answervote', 
			method: 'POST',
			data: {aid: aid, type: "up"},
			dataType: 'json', // so that returned json is automatically converted into object
			context: this, // so that we can access this from inside the callback
			success: function(data){
				$(this).parent().find(".totalvotes").text(data.votes);
			}
			, error: function(data){
				alert(data.responseText);
			}
    }); // end of function .ajax
	});

	$(".downvoteanswer").on( "click", function() {
		var aid = $(this).data('aid');
		$.ajax({
			url: '/homepage/answervote', 
			method: 'POST',
			data: {aid: aid, type: "down"},
			dataType: 'json',
			context: this,
			success: function(data){
				$(this).parent().find(".totalvotes").text(data.votes);
			}
			, error: function(data){
				alert(data.responseText);
			}
    }); // end of function .ajax
	});

}


function truncatinglength(){
var minimized_elements = $('p.cleartext');

minimized_elements.each(function(){    
var t = $(this).text();        
if(t.length < 100) return;

$(this).html(
		t.slice(0,100)+'<span>... </span><a href="#" class="more">More</a>'+
		'<span style="display:none;">'+ t.slice(100,t.length)+' <a href="#" class="less">Less</a></span>'
		);
	}); 

	$('a.more', minimized_elements).click(function(event){
		event.preventDefault();
	$(this).hide().prev().hide();
	$(this).next().show();        
 	});

	$('a.less', minimized_elements).click(function(event){
		event.preventDefault();
		$(this).parent().hide().prev().show().prev().show();    
	});
 }