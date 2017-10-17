post '/login' do
	
	user = User.find_by(email: params[:user][:email])
	if user && user.authenticate(params[:user][:password])
		session[:user_id] = user.id 

		#if this user is found, it means the email is valid, + the password is as per saved, then you can go into..
		redirect "/users/#{user.id}"
	else
		redirect '/'
	end
	
end

get '/logout' do
	session[:user_id] = nil
	redirect '/'
	#kill a session when user chooses to logout
	#redirect to appropriate page
end
