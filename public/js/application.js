$(document).ready(function() {
	$('#login-button').click(function() {
		$('#sign-in-container').css("visibility","visible");
		$('#register-container').css("display","none");
		$('#login-button').css("visibility","hidden");
		$('#login-container').animate({left: '320px'});
	});

	$('#register-button').click(function() {
		$('#sign-up-container').css("visibility","visible");
		$('#login-container').css("display","none");
		$('#register-button').css("visibility","hidden");
		$('#register-container').animate({right: '320px'});
	});

	$('#login-back').click(function(){
		$('#sign-in-container').css("visibility","hidden");
		$('#login-button').css("visibility","visible");
		$('#login-container').animate({left: '0px'},"fast");
		$('#register-container').css("display","block");
	});

	$('#register-back').click(function(){
		$('#sign-up-container').css("visibility","hidden");
		$('#register-button').css("visibility","visible");
		$('#register-container').animate({right: '0px'},"fast");
		$('#login-container').css("display","block");
	});

	$('#setting-button').hover(function(){
		$('#sidebar').fadeIn();
	});

	$('#setting-button').mouseleave(function(){
		$('#sidebar').css("display","none");
	});
});