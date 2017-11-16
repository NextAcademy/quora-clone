post '/sessions' do 
	user = User.find_by(email:params[:email])
	if user.authenticate(params[:password])
		session[:user_id] = user.id
		redirect "/user/#{user.id}"
	else
		redirect '/'
	end
end