post '/sessions' do
	@current_user = User.find_by(email: params[:email])
	if (@current_user && @current_user.authenticate(params[:password]))
		session[:id] = @current_user.id
		redirect '/dashboard'
	else
		@login_error = 'Invalid login'
		erb :'static/index'
	end
end

get '/sessions/logout' do
	session.clear
	redirect '/'
end