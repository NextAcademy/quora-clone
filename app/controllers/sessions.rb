post '/login' do 
	user = User.find_by(email:params[:email])
	if user.authenticate(params[:password])
		session[:user_id] = user.id
		redirect "/users/#{user.id}"
	else
		redirect '/'
	end
end

get '/logout' do 
	session[:user_id] = nil
	erb :"static/index"
end