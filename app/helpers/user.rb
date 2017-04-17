helpers do
	def current_user
		if session[:user_id]
			@current_user ||= User.find(session[:user_id])
		end
	end

	def logged_in?
		!current_user.nil?
	end

	def create_buttons
		if logged_in?
			"<form action=/logout method=post>
				<input type=submit value='Logout'>"
		else 
			"<form action=/login method=post>
				<input type=submit value='Login'>"
		end
	end
end