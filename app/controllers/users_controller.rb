enable :sessions

post '/signup' do
	user = User.new(params[:user])
	if user.save
		redirect "/users/#{user.id}"
	else
		flash[:error_sign_up] = user.errors.full_messages
		redirect '/signup'
	end
end

post '/login' do 
	result = User.email_password_matches?(params[:user][:email],params[:user][:password])
	if result.nil?
		flash[:no_account] = "You do not have an account. Please sign up "
		redirect '/login'
	else 
		if result.class != String
			session[:user_id] = result.id
			redirect "/users/#{result.id}"
		else 
			flash[:wrong_password] = result
			redirect '/login'
		end 
	end
end

post '/logout' do
	session[:user_id] = nil
	redirect '/'
end

get '/users/:id' do
	if logged_in?
		erb :'users/profile'
	else 
		redirect '/login'
	end
end

