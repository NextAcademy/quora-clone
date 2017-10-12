$(document).ready(function(){
	$('#signup-link').click(function(){
		$('#signup').show()
		$('#login').hide()
	})

	$('#login-link').click(function(){
		$('#login').show()
		$('#signup').hide()
	})
})