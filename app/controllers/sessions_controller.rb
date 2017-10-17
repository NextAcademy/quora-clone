#CREATE SESSION
post '/login' do
	@user = User.authenticate(params)
	
	if @user
		session[:user_id] = @user.id
		redirect "/users/#{@user.id}"
	else
		redirect "/"
	end
end


post '/logout' do
	session[:user_id] = nil
	redirect "/"
end